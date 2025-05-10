extends Node

class_name Upgrade

var type : ScoreType.type
var cost : float


# Valores default
func get_additive_increase():
	return 0

func get_multiplicative_increase():
	return 1

func unlock_condition():
	return true

func on_purchase():
	#Lo que se nos cante
	pass
