extends Area2D

class_name Bullet

@export var Speed = 500

@export var target_name = ""

func _ready():
	var sprite_check = $Sprite2D
	
# children modify this for how the bullet behaves
func _physics_process(delta):
	super(delta)
	pass

func _on_bullet_hit(body):
	if body.name == "TileMap":
		print("hit tilemap")
		queue_free()
