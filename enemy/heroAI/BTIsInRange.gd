@icon("res://addons/yet_another_behavior_tree/src/Assets/Icons/btcondition.png")
class_name ConditionPlayerIsInRange
extends BTCondition

@export var RangeToPlayer:int = 200

func tick(actor:Node, blackboard:BTBlackboard) -> int:
	var Agent = blackboard.data["Agent"]
	var Player = blackboard.data["Player"]
	var actor_position:Vector2 = Agent.global_position
	var player_distance:float = actor_position.distance_to(Player.position)

	if player_distance <= RangeToPlayer:
		return BTTickResult.SUCCESS

	return BTTickResult.FAILURE
