extends Map
class_name MapCity

func _ready () -> void:
	self.id = GameManager.MapID.City

func _on_area_exits_forest_body_entered (body: Node2D) -> void:
	if body is Player:
		self.game_manager.change_map(GameManager.MapID.Forest)
