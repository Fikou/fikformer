extends BTAction

class_name ActionMoveTo

var IsAtLocation = false

@export var movement_speed = 100

func tick(actor:Node, blackboard:BTBlackboard) -> int:
	var Agent = blackboard.data["Agent"]
	var NavAgent = blackboard.data["NavAgent"]
	var Player = blackboard.data["Player"]

	NavAgent.path_desired_distance = 200
	NavAgent.target_desired_distance = 200
	NavAgent.target_position = Player.global_position

	if NavAgent.is_navigation_finished():
		return BTTickResult.SUCCESS
	
	var next_path_position = NavAgent.get_next_path_position()
	
	var current_agent_position = Agent.global_position
	
	var dir = (next_path_position - current_agent_position).normalized()
	Agent.velocity = dir * movement_speed
	Agent.move_and_slide()
		
	return BTTickResult.RUNNING
	pass
