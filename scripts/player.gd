extends Character
class_name Player

enum State { Idle, Walking, Attack }

const speed : float = 3

var state : State = State.Idle
var dir : Direction = Direction.Down

@onready var anim : AnimationPlayer = $animation
@onready var sprite : Sprite2D = $sprite
@onready var hitbox : Area2D = $hitbox

func _ready ():
	self.anim.play("idle_down")

func _physics_process (delta: float) -> void:
	var dir_vector = Vector2.ZERO
	var moved : bool = false
	
	if self.state == State.Attack:
		return
	
	var previous_anim = anim.get_current_animation()
	
	if Input.is_action_pressed("ui_left"):
		dir_vector.x -= 1
		self.anim.play("walk_right")
		self.sprite.flip_h = true
		moved = true
		self.dir = Direction.Left
	if Input.is_action_pressed("ui_right"):
		dir_vector.x += 1
		self.anim.play("walk_right")
		self.sprite.flip_h = false
		moved = true
		self.dir = Direction.Right
	if Input.is_action_pressed("ui_up"):
		dir_vector.y -= 1
		self.anim.play("walk_up")
		moved = true
		self.dir = Direction.Up
	if Input.is_action_pressed("ui_down"):
		dir_vector.y += 1
		self.anim.play("walk_down")
		moved = true
		self.dir = Direction.Down
	
	if moved:
		self.state = State.Walking
		dir_vector = dir_vector.normalized()
	else:
		self.state = State.Idle
		
		match previous_anim:
			"walk_right":
				self.anim.play("idle_right")
			"walk_down":
				self.anim.play("idle_down")
			"walk_up":
				self.anim.play("idle_up")

	# Move the character
	#position += direction * speed * dt
	move_and_collide(dir_vector * self.speed * delta)

func _input (event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		self.state = State.Attack
		
		match dir:
			Direction.Left:
				self.anim.play("attack_right")
				self.hitbox.get_node("left").disabled = false
			Direction.Right:
				self.anim.play("attack_right")
				self.hitbox.get_node("right").disabled = false
			Direction.Down:
				self.anim.play("attack_down")
				self.hitbox.get_node("down").disabled = false
			Direction.Up:
				self.anim.play("attack_up")
				self.hitbox.get_node("up").disabled = false

func anim_ended_attack_right () -> void:
	self.state = State.Idle
	self.anim.play("idle_right")
	self.hitbox.get_node("left").disabled = true
	self.hitbox.get_node("right").disabled = true

func anim_ended_attack_down () -> void:
	self.state = State.Idle
	self.anim.play("idle_down")
	self.hitbox.get_node("down").disabled = true

func anim_ended_attack_up () -> void:
	self.state = State.Idle
	self.anim.play("idle_up")
	self.hitbox.get_node("up").disabled = true

func attack (enemy: Enemy) -> void:
	enemy.receive_damage()

func _on_hitbox_area_entered (area: Area2D) -> void:
	var parent = area.get_parent()
	
	if parent is Enemy:
		attack(parent)
