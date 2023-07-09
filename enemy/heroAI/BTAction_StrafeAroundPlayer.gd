extends BTAction

class_name StrafeAroundPlayerAction

var IsAtLocation = false
@export var movement_speed = 100
var random_offset = Vector2(0,0)
var agent_loc_initial = Vector2(0,0)

func start(blackboard:BTBlackboard) -> void:
	var Agent = blackboard.data["Agent"]
	random_offset = Vector2(randf_range(-50,50), randf_range(-50,50))
	agent_loc_initial = Agent.global_position
	pass

func tick(actor:Node, blackboard:BTBlackboard) -> int:
	var Agent = blackboard.data["Agent"]
	var NavAgent = blackboard.data["NavAgent"]
	var Player = blackboard.data["Player"]

	NavAgent.path_desired_distance = 1
	NavAgent.target_desired_distance = 1
	
	##var distance_to_player = Player.distance_to(Agent)
	##Player.transform.looking_at(Agent)
	##var target_pos = Vector2(0,0)
	
	NavAgent.target_position = agent_loc_initial + random_offset

	if NavAgent.is_navigation_finished():
		return BTTickResult.SUCCESS
	
	var next_path_position = NavAgent.get_next_path_position()
	var current_agent_position = Agent.global_position
	
	var dir = (next_path_position - current_agent_position).normalized()
	Agent.velocity = dir * movement_speed
	Agent.move_and_slide()
		
	return BTTickResult.RUNNING
	pass
