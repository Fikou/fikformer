extends Attack

func perform_attack(delta):
	var direction = ((Attacker.PlayerRef.position + Attacker.PlayerRef.velocity) - Attacker.position).normalized()
	fire_bullet(delta,direction)
	pass
