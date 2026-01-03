extends UnlockCondition
class_name DodgeCount

@export var dodge_count : int

var dodge_bonus : float


func unlock_condition() -> bool:
	return MedieManager.surfer_dodge_count >= dodge_count

func get_description() -> String:
	return "Esquiva " + str(dodge_count) + " obstáculos en el minijuego Original"
