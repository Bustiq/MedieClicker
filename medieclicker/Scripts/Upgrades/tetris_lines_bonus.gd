extends Upgrade
class_name TetrisLinesBonus

var bonus_per_line : float
var required_lines : int

func _init(_id : int, _upgrade_name : String, _cost : float, _icon : Texture2D, _lines : int, _bonus : float) -> void:
	var l := "línea"
	if _lines != 1:
		l += "s"
	super(_id, _upgrade_name, "+" + str(_bonus) + " medies/linea", ScoreType.type.TETRIS, _cost, _icon, "Haz " + str(_lines) + " " + l + " en el tetris")
	required_lines = _lines
	bonus_per_line = _bonus

func unlock_condition():
	return MedieManager.tetris_lines_cleared >= required_lines

func get_additive_increase():
	return bonus_per_line
