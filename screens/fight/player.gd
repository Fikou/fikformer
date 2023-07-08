extends CharacterBody2D


const SPEED = 200.0
const SLOW_SPEED = 100.0
const JUMP_VELOCITY = -400.0

var ATTACK_COOLDOWN_TIME = 0.1
var attack_cd = 0.1
@onready var BulletScene: PackedScene = load("res://bullets/bullet_player.tscn")

var dodging = false
var DODGE_COOLDOWN = 1


var cursor_idle = load("res://assets/cursor.png")
var cursor_firing = load("res://assets/cursor_firing.png")

# tween between red and white, move to ready to set this up
func _process(delta):
	handle_firing(delta)

# use delta
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

func handle_firing(delta):
	#lower cooldowns
	attack_cd = move_toward(attack_cd, 0, delta)
	var can_fire = false
	if !attack_cd:
		can_fire = true
	
	#see if we are firing
	if dodging:
		return
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		Input.set_custom_mouse_cursor(cursor_firing)
		if can_fire:
			fire_projectile()
	else:
		Input.set_custom_mouse_cursor(cursor_idle)

func fire_projectile():
	attack_cd = ATTACK_COOLDOWN_TIME
	
	var BulletInstance = BulletScene.instantiate()
	owner.add_child(BulletInstance)
	BulletInstance.set_position(position)
	BulletInstance.look_at(get_global_mouse_position())
	
	
