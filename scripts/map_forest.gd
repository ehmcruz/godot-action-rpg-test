extends Map
class_name MapForest

func _ready () -> void:
	self.id = GameManager.MapID.Forest

func _on_area_exits_city_body_entered (body: Node2D) -> void:
	if body is Player:
		game_manager.change_map(GameManager.MapID.City)
