extends Control

signal change_view_requested(next_scene: PackedScene)

@export var host_scene: PackedScene
@export var join_scene: PackedScene

@onready var host_button: Button = $ColorRect/VB_Buttons/Button_Host
@onready var join_button: Button = $ColorRect/VB_Buttons/Button_Join

func _ready() -> void:
	host_button.pressed.connect(on_host_pressed)
	join_button.pressed.connect(on_join_pressed)

func on_host_pressed() -> void:
	change_view_requested.emit(host_scene)

func on_join_pressed() -> void:
	change_view_requested.emit(join_scene)
