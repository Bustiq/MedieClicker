extends Upgrade

var required_medies : float

func _init(_id : int, _upgrade_name : String, _description : String, _type : ScoreType.type, _cost : float, _icon : Texture2D) -> void:
	super(_id, _upgrade_name, _description, _type, _cost, _icon)

func unlock_condition():
	return MedieManager.total_medie_count > required_medies or NumberHelper.equals( MedieManager.total_medie_count, required_medies)

func on_purchase():
	print("Pong desbloqueado")
