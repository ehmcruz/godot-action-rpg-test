extends Character
class_name Enemy

const speed : float = 3

@onready var anim : AnimationPlayer = $animation
@onready var sprite : Sprite2D = $sprite

func _ready ():
	anim.play("idle_down")

func _physics_process (delta: float) -> void:
	pass
