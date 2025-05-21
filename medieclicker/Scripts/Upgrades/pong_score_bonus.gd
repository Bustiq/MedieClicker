extends Upgrade
class_name PongScoreBonus

var required_goals : int
var flat_bonus : float


func _init(_id : int, _upgrade_name : String, _description : String, _cost : float, _icon : Texture2D, _goals : int, _bonus : float) -> void:
	super(_id, _upgrade_name, _description, ScoreType.type.PONG, _cost, _icon)
	required_goals = _goals
	flat_bonus = _bonus

func unlock_condition():
	return MedieManager.pong_goals_count >= required_goals

func get_additive_increase():
	return flat_bonus
