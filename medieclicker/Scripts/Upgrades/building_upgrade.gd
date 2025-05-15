extends Upgrade
class_name BuildingUpgrade

var flat_bonus : float
var times_bonus : float
var building_unlock_count : int
var building : Node


func _init(_upgrade_name : String, _description : String, _building : Node, _cost : float, _icon : Texture2D, _building_unlock_count : int, _flat_bonus : float = 0, _times_bonus : float = 1) -> void:
	super(_upgrade_name, _description, _building.score_type, _cost, _icon)
	self.flat_bonus = _flat_bonus
	self.times_bonus = _times_bonus
	self.building_unlock_count = _building_unlock_count
	self.building = _building




func get_additive_increase():
	return flat_bonus

func get_multiplicative_increase():
	return times_bonus



const BUILDING_CONTAINER_CHILD_ID = 0
func unlock_condition():
	#var buildings = get_tree().current_scene.get_child(0)
	#for building in buildings:
	#	if building.score_type == type:
	#		return building.building_count >= building_unlock_count
	#get_parent().hola_error_vaya
	return building.building_count >= building_unlock_count
