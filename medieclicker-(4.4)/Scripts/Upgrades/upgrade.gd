extends Node

class_name Upgrade

var id : int
var type : ScoreType.type
var cost : float
var upgrade_name : String
var description : String
var icon : Texture2D

var unlock_description : String
#Para savefiles, si es que hacemos
#var id : int
func _init(_id : int, _upgrade_name : String, _description : String, _type : ScoreType.type, _cost : float, _icon : Texture2D, _unlock_description : String) -> void:
	self.id = _id
	self.upgrade_name = _upgrade_name
	self.description = _description
	self.cost = _cost
	self.type = _type
	self.icon = _icon
	self.unlock_description = _unlock_description

# Valores default
func get_additive_increase():
	return 0

func get_multiplicative_increase():
	return 1


func get_id():
	return id

func unlock_condition():
	return true

func on_purchase():
	#Lo que se nos cante
	pass
