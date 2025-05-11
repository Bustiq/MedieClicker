extends Node



#Lo separo por clase así optimizamos la búsqueda por condición de desbloqueo

#Este diccionario tiene como clave el ScoreType.type y como valor la lista de building upgrades de ese tipo
var building_upgrades := {}
const upgrade_scene = "res://Scenes/upgrade.tscn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for score_type in ScoreType.type.values():
		building_upgrades.set(score_type, [])
	add_building_upgrade(BuildingUpgrade.new("Mejor pan", "Building 1 *2 mps", $"../../Buildings/Building", 10, load("res://Sprites/Upgrades/1_Better_bread.png"), 2, 0, 2))
	add_building_upgrade(BuildingUpgrade.new("Semillas de sésamo", "Building 1 *2 mps", $"../../Buildings/Building", 100, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 10, 0, 2))
	
	SignalManager.on_building_purchased.connect(on_building_purchased)


func add_building_upgrade(upgrade : Upgrade):
	building_upgrades.get(upgrade.type).append(upgrade)
	#building_upgrades.set(upgrade.type, building_upgrades.get(upgrade.type).append(upgrade))

func on_building_purchased(type : ScoreType.type):
	for upgrade in building_upgrades[type]:
		print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
		if upgrade.unlock_condition():
			building_upgrades[type].erase(upgrade)
			var instance = load(upgrade_scene).instantiate()
			instance.set_upgrade(upgrade)
			add_child(instance)
			
		
