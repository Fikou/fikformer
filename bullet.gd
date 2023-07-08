extends Node2D

class_name Bullet

@export var target_name = ""

var sprite = null

func _ready():
	sprite = $Sprite2D
	if !sprite:
		push_warning("no sprite for "+self.name+"!")

# children modify this for how the bullet behaves
func _physics_process(delta):
	pass

func _on_bullet_hit(body):
	if body.name == "TileMap":
		print("hit tilemap")
		queue_free()
