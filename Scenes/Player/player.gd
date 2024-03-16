extends CharacterBody2D

@onready var sprite = $Sprite

@export var move_speed = 400.0

@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

var facing_right = true

func _physics_process(delta):
	velocity.y += get_gravity() * delta
	velocity.x = move_toward(velocity.x, get_input_velocity() * move_speed, 25)
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		jump()
	
	move_and_slide()
	animation()
	

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump():
	velocity.y = jump_velocity

func get_input_velocity() -> float:
	var horizontal := 0.0
	
	if Input.is_action_pressed("left"):
		horizontal -= 1.0
	if Input.is_action_pressed("right"):
		horizontal += 1.0
	
	return horizontal
	
func animation():
	if velocity.x > 0:
		facing_right = true
	elif velocity.x < 0:
		facing_right = false
	sprite.flip_h = !facing_right
	if velocity == Vector2.ZERO:
		sprite.play("Idle")
	else:
		sprite.play("Run")
