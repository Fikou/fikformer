extends Bullet

class_name BulletPlayer

func _ready():
	var fired_at: Vector2 = get_global_mouse_position()
	look_at(fired_at)

func _physics_process(delta):
	pass
