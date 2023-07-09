extends Enemy

class_name Hero

@export var PlayerRef: Player = null
@export var NavAgentRef: NavigationAgent2D = null

func _ready():
	super()
	var attacks = get_node("/root/Game/fight/EnemyAttacks").duplicate()
	add_child(attacks)
	
	for attack in attacks.get_children():
		print(attack.name)
		if attack is Attack:
			attack.Attacker = self
	
	var blackboard:BTBlackboard = get_node("HeroAI/BTBlackboard")
	blackboard.data["Agent"] = self
	blackboard.data["Player"] = PlayerRef
	blackboard.data["NavAgent"] = NavAgentRef
	pass
