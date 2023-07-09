extends Character

class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

const ATTACK_COOLDOWN_TIME = 0.1
var attack_cd = 0.1
@onready var BulletScene: PackedScene = load("res://bullets/bullet_player.tscn")

var dodging = false
# how long you are dodging
const DODGE_DURATION = 0.8
const DODGE_INITIAL_VELOCITY = 25000
const DODGE_LOST_VELOCITY = 500
var dodge_velocity = DODGE_INITIAL_VELOCITY
var dodge_dir = Vector2(0,0)
const DODGE_COOLDOWN_TIME = 1
var dodge_cd = 0

var cursor_idle = load("res://assets/cursor.png")
var cursor_firing = load("res://assets/cursor_firing.png")

# tween between red and white, move to ready to set this up
func _process(delta):
	handle_sprite(delta)
	handle_firing(delta)

func handle_sprite(delta):
	var mouse_pos = get_local_mouse_position()
	$sprite.set_flip_h(mouse_pos.x > 0)

# use delta
func _physics_process(delta):
	#lower cooldowns
	dodge_cd = move_toward(dodge_cd, 0, delta)
	
	#check for dodges
	if Input.is_action_pressed("dash"):
		if !dodge_cd && !dodging:
			start_dodge()
	
	#dodge!
	if dodging:
		dodge_move(delta)
	else:
		normal_move(delta)

func normal_move(delta):
	var current_speed = SPEED
	var up_down = Input.get_axis("up", "down")
	var left_right = Input.get_axis("left", "right")

	if up_down:
		velocity.y = up_down * current_speed
	else:
		velocity.y = 0
	if left_right:
		velocity.x = left_right * current_speed
	else:
		velocity.x = 0

	move_and_slide()

func dodge_move(delta):
	var dodge_vector = dodge_dir * dodge_velocity * delta
	dodge_velocity = move_toward(dodge_velocity, 0, DODGE_LOST_VELOCITY)
	velocity = dodge_vector
	
	move_and_slide()

func start_dodge():
	dodging = true
	$sprite.set_rotation_degrees(0)
	$sprite.play("idle")
	dodge_velocity = DODGE_INITIAL_VELOCITY
	var mouse_angle = get_angle_to(get_global_mouse_position())
	dodge_dir = Vector2(cos(mouse_angle), sin(mouse_angle))
	var tween = get_tree().create_tween()
	
	var roll_to_degrees = 360
	if !$sprite.is_flipped_h():
		roll_to_degrees = -roll_to_degrees
	tween.tween_property($sprite, "rotation", deg_to_rad(roll_to_degrees), DODGE_DURATION)
	await get_tree().create_timer(DODGE_DURATION).timeout
	end_dodge()

func end_dodge():
	dodging = false
	dodge_cd = DODGE_COOLDOWN_TIME

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
		Input.set_custom_mouse_cursor(cursor_firing, Input.CURSOR_ARROW, Vector2(8,8))
		if can_fire:
			$sprite.play("attacking")
			fire_projectile()
	else:
		Input.set_custom_mouse_cursor(cursor_idle, Input.CURSOR_ARROW, Vector2(8,8))
		if can_fire:
			$sprite.play("idle")

func fire_projectile():
	attack_cd = ATTACK_COOLDOWN_TIME
	var BulletInstance = BulletScene.instantiate()
	owner.add_child(BulletInstance)
	BulletInstance.set_position(position)
	BulletInstance.look_at(get_global_mouse_position())
	var perfect_rotation_deg = rad_to_deg(BulletInstance.rotation)
	var imperfect_rotation_deg = perfect_rotation_deg + randi_range(-5, 5)
	BulletInstance.rotation =+ deg_to_rad(imperfect_rotation_deg)
