extends Resource

class_name UpgradeResource

@export var id : int
@export var upgrade_name : String
@export var cost : float
@export var icon_name : String

@export var unlocking : UnlockCondition
var description : String
var unlock_description : String

func get_id():
	return id

func unlock_condition():
	return unlocking.unlock_condition()


func on_purchase():
	pass

func get_description():
	return ""

func get_unlock_description():
	return unlocking.get_description()
