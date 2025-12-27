extends ScoreBonus
class_name ProducerBonus


@export var producer_requirement : int

func unlock_condition():
	return MedieManager.get_producer(type).producer_count >= producer_requirement

func get_description():
	var result : String
	if additive:
		result = "Cada "
		
		match type:
			ScoreType.type.BULDING_1:
				result += "Rollo de cocina "
			ScoreType.type.BUILDING_2:
				result += "Parrilla "
		
		result += "produce +" + str(increase) + "medies/segundo"
	else:
		result = "Producción de "
		
		match type:
			ScoreType.type.BULDING_1:
				result += "Rollos de cocina "
			ScoreType.type.BUILDING_2:
				result += "Parrillas "
		result += "x" + str(increase)
