extends UpgradeResource
class_name ScoreBonus

@export var type : ScoreType.type
@export var increase : float
@export var additive : bool


func get_bonus() -> float:
	return increase

func apply_bonus(value : float) -> float:
	if additive:
		return value + increase
	return value * increase

func get_description():
	match type:
		ScoreType.type.CLICK:
			return "Medies/click x" + str(increase)
		ScoreType.type.BULDING_1:
			if additive:
				return "Cada rollo de cocina produce +" + str(increase) + "medies/s"
			else:
				return "Producción de rollos de cocina x" + str(increase)
		ScoreType.type.BUILDING_2:
			if additive:
				return "Cada parrilla produce +" + str(increase) + "medies/s"
			else:
				return "Producción de parillas x" + str(increase)
		ScoreType.type.PONG:
			return "Medies/gol x" + str(increase)
		ScoreType.type.SURFER:
			return "Medies/esquive x" + str(increase)
