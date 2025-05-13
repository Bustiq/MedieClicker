extends Node



#Lo separo por clase así optimizamos la búsqueda por condición de desbloqueo

#Este diccionario tiene como clave el ScoreType.type y como valor la lista de building upgrades de ese tipo
var locked_building_upgrades := {}
var unlocked_building_upgrades := {}
var purchased_building_upgrades := {}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for score_type in ScoreType.type.values():
		locked_building_upgrades.set(score_type, [])
		unlocked_building_upgrades.set(score_type, [])
		purchased_building_upgrades.set(score_type, [])

	SignalManager.on_building_purchased.connect(on_building_purchased)
	SignalManager.on_upgrade_purchased.connect(on_upgrade_purchased)

func create_building_upgrade(upgrade : BuildingUpgrade):
	add_building_upgrade(locked_building_upgrades, upgrade)

func add_building_upgrade(dictionary, upgrade : BuildingUpgrade):
	dictionary.get(upgrade.type).append(upgrade)
	#building_upgrades.set(upgrade.type, building_upgrades.get(upgrade.type).append(upgrade))

func remove_building_upgrade(dictionary, upgrade : BuildingUpgrade):
	dictionary[upgrade.type].erase(upgrade)

func unlock_building_upgrade(upgrade : BuildingUpgrade):
	remove_building_upgrade(locked_building_upgrades, upgrade)
	add_building_upgrade(unlocked_building_upgrades, upgrade)

func on_building_purchased(type : ScoreType.type):
	var unlocked = []
	for upgrade in locked_building_upgrades[type]:
		print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
		if upgrade.unlock_condition():
			unlocked.append(upgrade)
	for upgrade in unlocked:
		unlock_building_upgrade(upgrade)
		SignalManager.on_upgrade_unlocked.emit(upgrade)

func on_upgrade_purchased(upgrade : Upgrade):
	print("purchased!")
	remove_building_upgrade(unlocked_building_upgrades, upgrade)
	add_building_upgrade(purchased_building_upgrades, upgrade)

func get_building_additive_bonus(building : ScoreType.type):
	var total_bonus = 0.0
	
	for upgrade in purchased_building_upgrades[building]:
		total_bonus += upgrade.get_additive_increase()
	return total_bonus
