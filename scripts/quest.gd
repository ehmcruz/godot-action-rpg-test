extends Node
class_name Quest

@onready var game_manager : GameManager = get_tree().current_scene
var id
var level_of_map = { }

func on_level_loaded (level, from) -> void:
	pass
