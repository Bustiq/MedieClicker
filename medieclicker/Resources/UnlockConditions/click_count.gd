extends UnlockCondition
class_name ClickCount

@export var required_clicks : int

func get_description():
	return "Clickea a MedieBurger " + str(required_clicks) + " veces"
