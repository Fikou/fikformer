extends RigidBody2D

class_name Bullet

@export var target_name = ""

func _ready():
	var sprite_check = $Sprite2D
	var area_check: Area2D = $CollisionShape2D
	
	if !sprite_check:
		push_warning("no sprite for "+self.name+"!")
	if !area_check:
		push_warning("no area for "+self.name+"!")
	else:
		area_check.body_entered.connect(self._on_bullet_hit)

# children modify this for how the bullet behaves
func _physics_process(delta):
	pass

func _on_bullet_hit(body):
	if body.name == "TileMap":
		print("hit tilemap")
		queue_free()
