extends UnlockCondition
class_name TotalMedies

@export var total_medies : int

func unlock_condition():
	return MedieManager.total_medie_count > total_medies or NumberHelper.equals( MedieManager.total_medie_count, total_medies)

func get_description():
	return "Produce un total de " + str(total_medies) + " medies"
