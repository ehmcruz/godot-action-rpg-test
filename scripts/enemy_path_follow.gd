extends PathFollow2D
class_name EnemyPathFollow

@export var speed : float

func _physics_process (delta: float) -> void:
	set_progress(get_progress() + speed * delta)
	
