extends UnlockCondition


var required_lines : int



func unlock_condition():
	return MedieManager.tetris_lines_cleared >= required_lines

func get_description():
	var l := "línea"
	if required_lines > 1:
		l += "s"
	return "Haz " + str(required_lines) + " " + l + " en el tetris"
