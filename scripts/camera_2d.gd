extends Camera2D

@onready var camera_target : Node2D = get_node("../world/player")

func _ready():
	zoom = Vector2(Units.dist_to_px(1.0), Units.dist_to_px(1.0))

func _process (delta: float) -> void:
	if !camera_target:
		return
	
	position = camera_target.position
