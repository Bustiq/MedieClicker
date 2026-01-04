extends UnlockCondition
class_name Distractions


@export var distraction_count : int

func unlock_condition() -> bool:
	return MedieManager.texting_and_driving_accidents >= distraction_count

func get_description() -> String:
	return "En el juego original, chocate mientras estás leyendo la descripción de una mejora"
