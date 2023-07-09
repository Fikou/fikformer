extends CharacterBody2D

class_name Character 

@export var health:float = 100

func Damage(damage: int):
	health -= damage
	if(health < 0):
		Death()
		
func Death():
	queue_free()
	pass
