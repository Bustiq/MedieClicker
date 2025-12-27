extends Upgrade
class_name ProducerUpgrade

var flat_bonus : float
var times_bonus : float
var producer_unlock_count : int
var producer : Node


func _init(_id : int, _upgrade_name : String, _description : String, _producer : Node, _cost : float, _icon : Texture2D, _producer_unlock_count : int, _flat_bonus : float = 0, _times_bonus : float = 1) -> void:
	var producer_text : String
	if _producer.score_type == ScoreType.type.BULDING_1:
		producer_text = "rollos de cocina"
	else:
		producer_text = "parrillas"

	
	var unlock_desc = "Compra " + str(_producer_unlock_count) + " " + producer_text
	
	super(_id, _upgrade_name, _description, _producer.score_type, _cost, _icon, unlock_desc)
	self.flat_bonus = _flat_bonus
	self.times_bonus = _times_bonus
	self.producer_unlock_count = _producer_unlock_count
	self.producer = _producer




func get_additive_increase():
	return flat_bonus

func get_multiplicative_increase():
	return times_bonus



const BUILDING_CONTAINER_CHILD_ID = 0
func unlock_condition():
	#var producers = get_tree().current_scene.get_child(0)
	#for producer in producers:
	#	if producer.score_type == type:
	#		return producer.producer_count >= producer_unlock_count
	#get_parent().hola_error_vaya
	return producer.producer_count >= producer_unlock_count
