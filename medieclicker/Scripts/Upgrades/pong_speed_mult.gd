extends Upgrade
class_name PongSpeedBonus

var required_self_bounces : int
var speed_mult : float
var targets_player : bool


func _init(_id : int, _upgrade_name : String, _description : String, _cost : float, _icon : Texture2D, _bounces : int, _speed_mult : float, _targets_player : bool) -> void:
	super(_id, _upgrade_name, _description, ScoreType.type.PONG, _cost, _icon)
	required_self_bounces = _bounces
	speed_mult = _speed_mult
	targets_player = _targets_player

func unlock_condition():
	return MedieManager.pong_self_bounce_count >= required_self_bounces

func get_speed_increase():
	return speed_mult

func is_for_player():
	return targets_player
