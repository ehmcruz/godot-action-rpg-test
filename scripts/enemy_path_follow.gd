extends PathFollow2D
class_name EnemyPathFollow

@export var speed : float

@onready var enemy : Enemy = $enemy

func _ready () -> void:
	self.enemy.path = self

func _physics_process (delta: float) -> void:
	set_progress(get_progress() + self.speed * delta)
	
