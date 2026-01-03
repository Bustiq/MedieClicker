extends UnlockCondition
class_name PongGoalCount

@export var required_goals : int

func unlock_condition() -> bool:
	return MedieManager.pong_goals_count >= required_goals

func get_description() -> String:
	return "Haz " + str(required_goals) + " goles en el pong"
