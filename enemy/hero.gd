extends Enemy

class_name Hero

@export var PlayerRef: Player = null
@export var NavAgentRef: NavigationAgent2D = null

func _ready():
	super()
	var blackboard:BTBlackboard = get_node("HeroAI/BTBlackboard")
	blackboard.data["Agent"] = self
	blackboard.data["Player"] = PlayerRef
	blackboard.data["NavAgent"] = NavAgentRef
	pass
