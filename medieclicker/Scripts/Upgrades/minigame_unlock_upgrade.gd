extends Upgrade
class_name MinigameUnlockUpgrade

var required_medies : float
var viewport: SubViewport
var minigame_scene_path: String


func _init(_id : int, _upgrade_name : String, _description : String, _type : ScoreType.type, _cost : float, _icon : Texture2D, _medies : float, _sub_viewport : SubViewport, _minigame : String) -> void:
	super(_id, _upgrade_name, _description, _type, _cost, _icon)
	required_medies = _medies
	viewport = _sub_viewport
	minigame_scene_path = _minigame

func unlock_condition():
	return MedieManager.total_medie_count > required_medies or NumberHelper.equals( MedieManager.total_medie_count, required_medies)

func on_purchase():
	var scene = load(minigame_scene_path).instantiate()
	viewport.add_child(scene)
	print("Pong desbloqueado (On purchase)")
