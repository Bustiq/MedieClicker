extends UnlockCondition
class_name ProducerCount

@export var producer_type : ScoreType.type
@export var producer_requirement : int

func unlock_condition() -> bool:
	return MedieManager.get_producer(producer_type).producer_count >= producer_requirement

func get_description() -> String:
	var start := "Obtén " + str(producer_requirement)
	match producer_type:
		ScoreType.type.BULDING_1:
			start += " rollos de cocina"
		ScoreType.type.BUILDING_2:
			start += " parrillas"
	return start
