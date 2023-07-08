extends Bullet

class_name BulletStraight

func _physics_process(delta):
	position += transform.x * Speed * delta
	pass
