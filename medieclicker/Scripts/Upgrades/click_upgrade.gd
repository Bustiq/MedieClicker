extends Upgrade
class_name ClickUpgrade


var required_clicks
var flat_bonus

func _init(_id : int, _upgrade_name : String, _cost : float, _icon : Texture2D, _clicks : int, _bonus : float) -> void:
	
	flat_bonus = _bonus
	super(_id, _upgrade_name, "+" + str(flat_bonus) + " medies/click", ScoreType.type.CLICK, _cost, _icon, "Clickea " + str(_clicks) + " veces")
	required_clicks = _clicks

func unlock_condition():
	return MedieManager.click_count >= required_clicks

func get_additive_increase():
	return flat_bonus
