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
var total_upgrade_count := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for score_type in ScoreType.type.values():
		locked_upgrades.set(score_type, [])
		unlocked_upgrades.set(score_type, [])
		purchased_upgrades.set(score_type, [])
	
	SignalManager.on_upgrade_created.connect(create_upgrade)

	SignalManager.on_building_purchased.connect(on_building_purchased)
	SignalManager.on_upgrade_purchased.connect(on_upgrade_purchased)
	SignalManager.on_medies_changed.connect(on_medie_count_changed)
	#SignalManager.on_pong_score.connect(on_pong_score)
	#SignalManager.on_pong_self_bounce.connect(on_pong_self_bounce)
	#SignalManager.on_medie_clicked.connect(on_medie_clicked)
	SignalManager.on_pong_score.connect(check_for_unlocked_upgrades)
	SignalManager.on_pong_self_bounce.connect(check_for_unlocked_upgrades)
	SignalManager.on_medie_clicked.connect(check_for_unlocked_upgrades)
	SignalManager.on_surfer_dodge.connect(wrapper)
	SignalManager.on_tetris_line_cleared.connect(wrapper2)

# La señal tiene parámetros pero el método no.
# No sé cómo hacerlo bonito
func wrapper(obstacle : Obstacle):
	check_for_unlocked_upgrades()

# Lo mismo acá
func wrapper2(lines : int):
	
	check_for_unlocked_upgrades()


func create_upgrade(upgrade : Upgrade):
	for upgrade_type in locked_upgrades:
		for element in locked_upgrades[upgrade_type]:
			if upgrade.id == element.id:
				# Excepciones lol
				get_parent().call("La id "  + str(upgrade.id) + " está ocupada por " + upgrade.upgrade_name + " y " + element.upgrade_name)
	add_upgrade(locked_upgrades, upgrade)
	total_upgrade_count += 1
	#unlock_upgrade(upgrade)



func add_upgrade(dictionary, upgrade : Upgrade):
	dictionary.get(upgrade.type).append(upgrade)
	#building_upgrades.set(upgrade.type, building_upgrades.get(upgrade.type).append(upgrade))

func remove_upgrade(dictionary, upgrade : Upgrade):
	dictionary[upgrade.type].erase(upgrade)



func unlock_upgrade(upgrade : Upgrade):
	remove_upgrade(locked_upgrades, upgrade)
	add_upgrade(unlocked_upgrades, upgrade)
	SignalManager.on_upgrade_unlocked.emit(upgrade)

func on_building_purchased(type : ScoreType.type):
	var unlocked = []
	for upgrade in locked_upgrades[type]:
		
		#Solo los building upgrades hacen algo cuando se compra una building
		if  not upgrade is BuildingUpgrade:
			continue
		
		#print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
		if upgrade.unlock_condition():
			unlocked.append(upgrade)
	for upgrade in unlocked:
		unlock_upgrade(upgrade)
		

func on_upgrade_purchased(upgrade : Upgrade):
	remove_upgrade(unlocked_upgrades, upgrade)
	add_upgrade(purchased_upgrades, upgrade)

func get_additive_bonus(building : ScoreType.type):
	var total_bonus = 0.0
	
	for upgrade in purchased_upgrades[building]:
		if  upgrade is BuildingUpgrade or PongScoreBonus or ClickUpgrade:
			total_bonus += upgrade.get_additive_increase()
	return total_bonus


func on_medie_count_changed(_useless_but_needed_param : float):
	var unlocked = []
	for upgradeType in locked_upgrades:

		for upgrade in locked_upgrades[upgradeType]:
			#Solo los minigame unlock upgrades hacen algo cuando se agarran medies
			if  not (upgrade is MinigameUnlockUpgrade or upgrade is ShowElement or upgrade is Victory):
				continue
		
			#print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
			if upgrade.unlock_condition():
				unlocked.append(upgrade)
	
	for upgrade in unlocked:
		unlock_upgrade(upgrade)


#func on_pong_score():
	#var unlocked = []
	#for upgrade in locked_upgrades[ScoreType.type.PONG]:
		#if  not upgrade is PongScoreBonus:
			#continue
		##print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
		#if upgrade.unlock_condition():
			#unlocked.append(upgrade)
	#
	#for upgrade in unlocked:
		#unlock_upgrade(upgrade)

#
#
#func on_pong_self_bounce():
	#var unlocked = []
	#for upgrade in locked_upgrades[ScoreType.type.PONG]:
		#if  not upgrade is PongSpeedBonus:
			#continue
		##print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
		#if upgrade.unlock_condition():
			#unlocked.append(upgrade)
	#
	#for upgrade in unlocked:
		#unlock_upgrade(upgrade)

#
#func on_medie_clicked():
	#var unlocked = []
	#for upgrade in locked_upgrades[ScoreType.type.PONG]:
		#if not upgrade is ClickUpgrade:
			#continue
		#if upgrade.unlock_condition():
			#unlocked.append(upgrade)
	#
	#for upgrade in unlocked:
		#unlock_upgrade(upgrade)


func check_for_unlocked_upgrades():
	var unlocked = []
	for score_type in locked_upgrades:
		for upgrade in locked_upgrades[score_type]:
			if upgrade.unlock_condition():
				unlocked.append(upgrade)
	
	for upgrade in unlocked:
		unlock_upgrade(upgrade)


func get_pong_speed_bonus(player : bool):
	var total_speed_bonus := 1.0
	for upgrade in purchased_upgrades[ScoreType.type.PONG]:
		if not upgrade is PongSpeedBonus:
			continue
		if upgrade.is_for_player() != player:
			continue
		
		total_speed_bonus *= upgrade.get_speed_increase()
	return total_speed_bonus
