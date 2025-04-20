extends Node
class_name GameManager

enum MapID {
	Forest,
	City
}

enum LevelID {
	Forest_00,
	City_00
}

var level_scenes = {
	LevelID.Forest_00 : preload("res://scenes/level_forest_00.tscn"),
	LevelID.City_00 : preload("res://scenes/level_city_00.tscn")
}

var marker_names = {
	MapID.Forest : "marker_from_forest",
	MapID.City : "marker_from_city"
}

var world_view_scene = preload("res://scenes/world_view.tscn")
var player_scene = preload("res://scenes/player.tscn")

var world : Node2D
var player : Player = null
var current_level : Level = null
var quest_manager : QuestManager = QuestManager.new()

func _ready () -> void:
	self.player = self.player_scene.instantiate()
	self.player.name = "player"

	var world_view : Node2D = self.world_view_scene.instantiate()
	world_view.name = "world_view"
	self.add_child(world_view)
	
	self.world = world_view.get_node("subviewport_container").get_node("subviewport").get_node("world")

	self.current_level = self.level_scenes[LevelID.Forest_00].instantiate()
	self.current_level.name = "level"
	self.world.add_child(self.current_level)
	self.player.position = self.current_level.get_node("player_start_pos").position
	self.world.add_child(self.player)

func change_map (map_id: MapID) -> void:
	var current_map_id : MapID = self.current_level.map.id
	self.current_level.queue_free()

	var next_level_id : LevelID = self.quest_manager.current_quest.level_of_map[map_id]
	var next_level : Level = self.level_scenes[next_level_id].instantiate()
	next_level.name = "level"
	self.current_level = next_level
	self.world.add_child(self.current_level)
	
	var marker_name = self.marker_names[current_map_id]
	var marker : Marker2D = next_level.map.get_node(marker_name)
	var position = marker.position
	self.player.set_deferred("position", position)
