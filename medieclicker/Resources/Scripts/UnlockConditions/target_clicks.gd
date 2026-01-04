extends UnlockCondition
class_name TargetClicks

@export var target_clicks : int

func unlock_condition() -> bool:
	return MedieManager.target_click_count >= target_clicks


func get_description() -> String:
	return "Clickea " + str(target_clicks) + " blancos"
