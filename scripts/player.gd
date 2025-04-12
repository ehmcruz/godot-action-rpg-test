extends Character
class_name Player

enum State { Idle, Walking, Attack }

const speed : float = 3

var state : State = State.Idle
var dir : Direction = Direction.Down

@onready var anim : AnimationPlayer = $animation
@onready var sprite : Sprite2D = $sprite

func _ready ():
	anim.play("idle_down")

func _physics_process (delta: float) -> void:
	var dir_vector = Vector2.ZERO
	var moved : bool = false
	
	if state == State.Attack:
		return
	
	var previous_anim = anim.get_current_animation()
	
	if Input.is_action_pressed("ui_left"):
		dir_vector.x -= 1
		anim.play("walk_right")
		sprite.flip_h = true
		moved = true
		dir = Direction.Left
	if Input.is_action_pressed("ui_right"):
		dir_vector.x += 1
		anim.play("walk_right")
		sprite.flip_h = false
		moved = true
		dir = Direction.Right
	if Input.is_action_pressed("ui_up"):
		dir_vector.y -= 1
		anim.play("walk_up")
		moved = true
		dir = Direction.Up
	if Input.is_action_pressed("ui_down"):
		dir_vector.y += 1
		anim.play("walk_down")
		moved = true
		dir = Direction.Down
	
	if moved:
		state = State.Walking
		dir_vector = dir_vector.normalized()
	else:
		state = State.Idle
		
		match previous_anim:
			"walk_right":
				anim.play("idle_right")
			"walk_down":
				anim.play("idle_down")
			"walk_up":
				anim.play("idle_up")

	# Move the character
	#position += direction * speed * dt
	move_and_collide(dir_vector * speed * delta)

func _input (event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		state = State.Attack
		
		match dir:
			Direction.Left:
				anim.play("attack_right")
			Direction.Right:
				anim.play("attack_right")
			Direction.Down:
				anim.play("attack_down")
			Direction.Up:
				anim.play("attack_up")

func anim_ended_attack_right () -> void:
	state = State.Idle
	anim.play("idle_right")

func anim_ended_attack_down () -> void:
	state = State.Idle
	anim.play("idle_down")

func anim_ended_attack_up () -> void:
	state = State.Idle
	anim.play("idle_up")
