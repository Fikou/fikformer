extends CharacterBody2D


const SPEED = 200.0
const SLOW_SPEED = 100.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	var current_speed = SPEED
	if Input.is_action_pressed("walk"):
		current_speed = SLOW_SPEED
	
	var up_down = Input.get_axis("ui_up", "ui_down")
	var left_right = Input.get_axis("ui_left", "ui_right")

	if up_down:
		velocity.y = up_down * current_speed
	else:
		velocity.y = 0
	if left_right:
		velocity.x = left_right * current_speed
	else:
		velocity.x = 0

	move_and_slide()
