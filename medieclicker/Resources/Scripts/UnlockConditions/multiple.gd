extends UnlockCondition
class_name Multiple
@export var conditions : Array[UnlockCondition]


func unlock_condition() -> bool:
	for condition in conditions:
		if not condition.unlock_condition():
			return false
	return true

func get_description() -> String:
	var result = ""
	for condition in conditions:
		result += condition.get_description() + "\n"
	return result
