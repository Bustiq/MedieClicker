extends UnlockCondition


var required_lines : int



func unlock_condition() -> bool:
	return MedieManager.tetris_lines_cleared >= required_lines

func get_description() -> String:
	var l := "línea"
	if required_lines > 1:
		l += "s"
	return "Haz " + str(required_lines) + " " + l + " en el tetris"
