extends Character
class_name Enemy

const speed : float = 3

@onready var anim : AnimationPlayer = $animation
@onready var sprite : Sprite2D = $sprite

var path : EnemyPathFollow = null

func _ready ():
	self.anim.play("idle_down")

func _physics_process (delta: float) -> void:
	pass

func receive_damage () -> void:
	if self.path:
		self.path.queue_free()
	else:
		self.queue_free()	
