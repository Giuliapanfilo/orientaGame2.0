extends CharacterBody3D
class_name Player

@export var speed := 3.0
@export var sprite : AnimatedSprite3D

var can_move = true
var lock_animation = false

var last_direction = "up"
var last_action = "idle"

func _ready() -> void:
	if OS.is_debug_build():
		speed = 10


func _physics_process(delta):

	
	var direction = Vector3(
		Input.get_axis("ui_left","ui_right"),
		0,
		Input.get_axis("ui_up","ui_down")
	).normalized()
	
	if not lock_animation:
		if direction != Vector3.ZERO:
			last_action =  "move"
			if abs(direction.x) > abs(direction.z):
				last_direction = "right" if direction.x > 0 else "left"
			else:
				last_direction = "up" if direction.z < 0 else "down"
		else:
			last_action = "idle"
	
	velocity = direction * speed
	sprite.play(last_action + "_" + last_direction)

	if not is_on_floor():
		velocity.y += get_gravity().y * delta * 10
	else:
		velocity.y = 0

	if can_move:
		move_and_slide()
