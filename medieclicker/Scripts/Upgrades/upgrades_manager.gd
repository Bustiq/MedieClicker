extends Node



#Lo separo por clase así optimizamos la búsqueda por condición de desbloqueo

#var locked_total_medies_upgrades := {}
#var unlocked_total_medies_upgrades := {}
#var purchased_total_medies_upgrades := {}

#Este diccionario tiene como clave el ScoreType.type y como valor la lista de building upgrades de ese tipo
#var locked_building_upgrades := {}
#var unlocked_building_upgrades := {}
#var purchased_building_upgrades := {}

var locked_upgrades := {}
var unlocked_upgrades := {}
var purchased_upgrades := {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for score_type in ScoreType.type.values():
		locked_upgrades.set(score_type, [])
		unlocked_upgrades.set(score_type, [])
		purchased_upgrades.set(score_type, [])

	SignalManager.on_building_purchased.connect(on_building_purchased)
	SignalManager.on_upgrade_purchased.connect(on_upgrade_purchased)
	SignalManager.on_medies_changed.connect(on_medie_count_changed)


func create_upgrade(upgrade : Upgrade):
	add_upgrade(locked_upgrades, upgrade)

func add_upgrade(dictionary, upgrade : Upgrade):
	dictionary.get(upgrade.type).append(upgrade)
	#building_upgrades.set(upgrade.type, building_upgrades.get(upgrade.type).append(upgrade))

func remove_upgrade(dictionary, upgrade : Upgrade):
	dictionary[upgrade.type].erase(upgrade)



func unlock_upgrade(upgrade : Upgrade):
	remove_upgrade(locked_upgrades, upgrade)
	add_upgrade(unlocked_upgrades, upgrade)

func on_building_purchased(type : ScoreType.type):
	var unlocked = []
	for upgrade in locked_upgrades[type]:
		
		#Solo los building upgrades hacen algo cuando se compra una building
		if  not upgrade is BuildingUpgrade:
			continue
		
		print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
		if upgrade.unlock_condition():
			unlocked.append(upgrade)
	for upgrade in unlocked:
		unlock_upgrade(upgrade)
		SignalManager.on_upgrade_unlocked.emit(upgrade)

func on_upgrade_purchased(upgrade : Upgrade):
	print("purchased " + upgrade.upgrade_name + "! (upgrade manager)")
	remove_upgrade(unlocked_upgrades, upgrade)
	add_upgrade(purchased_upgrades, upgrade)

func get_building_additive_bonus(building : ScoreType.type):
	var total_bonus = 0.0
	
	for upgrade in purchased_upgrades[building]:
		if  upgrade is BuildingUpgrade:
			total_bonus += upgrade.get_additive_increase()
	return total_bonus



func on_medie_count_changed(useless_but_needed_param : float):
	var unlocked = []
	for upgradeType in locked_upgrades:

		for upgrade in locked_upgrades[upgradeType]:
			#Solo los minigame unlock upgrades hacen algo cuando se agarran medies
			if  not upgrade is MinigameUnlockUpgrade:
				continue
		
			print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
			if upgrade.unlock_condition():
				unlocked.append(upgrade)
	
	for upgrade in unlocked:
		unlock_upgrade(upgrade)
		SignalManager.on_upgrade_unlocked.emit(upgrade)
