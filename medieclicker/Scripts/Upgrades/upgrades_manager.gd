extends Node

#Lo separo por clase así optimizamos la búsqueda por condición de desbloqueo

#Este diccionario tiene como clave el ScoreType.type y como valor la lista de building upgrades de ese tipo
var building_upgrades := {}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for score_type in ScoreType.type.values():
		building_upgrades.set(score_type, [])
	add_building_upgrade(BuildingUpgrade.new("Mejora 1", "Building 1 *2 mps", $"../Buildings/Building", 10, null, 2, 0, 2))
	add_building_upgrade(BuildingUpgrade.new("Mejora 2", "Building 1 *2 mps", $"../Buildings/Building", 100, null, 50, 0, 2))
	SignalManager.on_building_purchased.connect(on_building_purchased)


func add_building_upgrade(upgrade : Upgrade):
	building_upgrades.get(upgrade.type).append(upgrade)
	#building_upgrades.set(upgrade.type, building_upgrades.get(upgrade.type).append(upgrade))

func on_building_purchased(type : ScoreType.type):
	for upgrade in building_upgrades[type]:
		print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
