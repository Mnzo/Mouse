extends Node

func _ready() -> void:
	#initialize_steam()
	pass

func initialize_steam() -> void:
	var initialize_response: Dictionary = Steam.steamInitEx(480, false)
	print("Did Steam initialize?: %s " % initialize_response)
