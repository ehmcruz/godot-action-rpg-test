extends AnimatableBody2D
class_name Character

const speed : float = 2

func _ready () -> void:
	# Set the initial position of the character
	position = Vector2.ZERO

func _physics_process (delta: float) -> void:
	# Get the input direction
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normalize the direction vector to ensure consistent speed
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Move the character
	#position += direction * speed * dt
	move_and_collide(direction * speed * delta)
	
