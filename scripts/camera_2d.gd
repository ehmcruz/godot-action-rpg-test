extends Camera2D

var camera_target : Node2D = null

func _ready():
	self.camera_target = game_manager.player
	zoom = Vector2(Units.dist_to_px(1.0), Units.dist_to_px(1.0))

func _process (delta: float) -> void:
	if !self.camera_target:
		return
	
	self.position = self.camera_target.position
