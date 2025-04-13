extends Node2D

var player_scene = preload("res://scenes/player.tscn")

func _ready() -> void:
	var player : Player = self.player_scene.instantiate()
	player.position = $player_start_pos.position
	player.name = "player"
	add_child(player)
