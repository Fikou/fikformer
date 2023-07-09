extends Area2D

class_name Bullet

@export var Speed = 500

@export var target_name = ""

@export var damage = 1

func _ready():
	var sprite_check = $Sprite2D
	
# children modify this for how the bullet behaves
func _physics_process(delta):
	super(delta)

func _on_bullet_hit(body):
	if body.is_in_group("Enemies"):
		body.Damage(damage)
		print("hit a " + str(body))
		queue_free()
