extends CanvasLayer
class_name MainMenuManager

@export var initial_view: PackedScene

var view_stack: Array[Control] = []

func _ready() -> void:
	if initial_view:
		push_view(initial_view)
		
func push_view(view_scene: PackedScene) -> void:
	if not view_stack.is_empty():
		view_stack.back().visible = false
		view_stack.back().process_mode = Node.PROCESS_MODE_DISABLED
		
	var new_view = view_scene.instantiate() as Control
	add_child(new_view)
	view_stack.append(new_view)
	
	if new_view.has_signal("back_requested"):
		new_view.connect("back_requested", pop_view)
		
	if new_view.has_signal("change_view_requested"):
		new_view.connect("change_view_requested", func(next_scene: PackedScene):
			push_view(next_scene)
		)
		
func pop_view() -> void:
	if view_stack.size() <= 1:
		return
		
	var dead_view = view_stack.pop_back()
	dead_view.queue_free()
	
	var previous_view = view_stack.back()
	previous_view.visible = true
	previous_view.process_mode = Node.PROCESS_MODE_INHERIT
