extends Upgrade
class_name SurferDodgeBonus

var dodge_bonus : float
var required_dodges : int

func _init(_id : int, _upgrade_name : String, _cost : float, _icon : Texture2D, _dodges : int, _bonus : float) -> void:
	super(_id, _upgrade_name, "+" + str(_bonus) + " medies/esquive", ScoreType.type.SURFER, _cost, _icon)
	required_dodges = _dodges
	dodge_bonus = _bonus

func unlock_condition():
	
	return MedieManager.surfer_dodge_count >= required_dodges

func get_additive_increase():
	return dodge_bonus
