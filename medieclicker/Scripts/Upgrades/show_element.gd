extends Upgrade
class_name ShowElement

var required_medies : float
var element: Node


func _init(_id : int, _upgrade_name : String, _description : String, _cost : float, _icon : Texture2D, _medies : float, _element : Node) -> void:
	super(_id, _upgrade_name, _description, ScoreType.type.OTHER, _cost, _icon, "Produce un total de " + str(_medies) + " medies")
	required_medies = _medies
	element = _element

func unlock_condition():
	return MedieManager.total_medie_count > required_medies or NumberHelper.equals( MedieManager.total_medie_count, required_medies)

func on_purchase():
	element.show()
