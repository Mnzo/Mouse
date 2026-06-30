extends Control

signal back_requested

@onready var back_button: Button = $ColorRect/Button_Back
@onready var createserver_button: Button = $ColorRect/Button_CreateServer

func _ready() -> void:
	back_button.pressed.connect(on_back_pressed)
	createserver_button.pressed.connect(on_createserver_pressed)
	
func on_createserver_pressed() -> void:
	pass
	
func on_back_pressed() -> void:
	back_requested.emit()
