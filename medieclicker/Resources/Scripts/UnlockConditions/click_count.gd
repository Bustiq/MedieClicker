extends UnlockCondition
class_name ClickCount

@export var required_clicks : int

func unlock_condition() -> bool:
	return MedieManager.click_count >= required_clicks


func get_description() -> String:
	return "Clickea a MedieBurger " + str(required_clicks) + " veces"
