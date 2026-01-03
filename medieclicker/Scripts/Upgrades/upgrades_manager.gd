extends Node



#Lo separo por clase así optimizamos la búsqueda por condición de desbloqueo

#var locked_total_medies_upgrades := {}
#var unlocked_total_medies_upgrades := {}
#var purchased_total_medies_upgrades := {}

#Este diccionario tiene como clave el ScoreType.type y como valor la lista de producer upgrades de ese tipo
#var locked_producer_upgrades := {}
#var unlocked_producer_upgrades := {}
#var purchased_producer_upgrades := {}

#var locked_upgrades := {}
#var unlocked_upgrades := {}
#var purchased_upgrades := {}
var total_upgrade_count := 0

var locked_upgrades := []
var unlocked_upgrades := []
var purchased_upgrades := []


var database : UpgradeDatabase = preload("res://Resources/upgrade_database.tres")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for score_type in ScoreType.type.values():
		locked_upgrades.set(score_type, [])
		unlocked_upgrades.set(score_type, [])
		purchased_upgrades.set(score_type, [])
	
	SignalManager.on_upgrade_created.connect(create_upgrade)

	SignalManager.on_producer_purchased.connect(on_producer_purchased)
	SignalManager.on_upgrade_purchased.connect(on_upgrade_purchased)
	SignalManager.on_medies_changed.connect(on_medie_count_changed)
	#SignalManager.on_pong_score.connect(on_pong_score)
	#SignalManager.on_pong_self_bounce.connect(on_pong_self_bounce)
	#SignalManager.on_medie_clicked.connect(on_medie_clicked)
	SignalManager.on_pong_score.connect(check_for_unlocked_upgrades)
	SignalManager.on_pong_self_bounce.connect(check_for_unlocked_upgrades)
	#SignalManager.on_medie_clicked.connect(check_for_unlocked_upgrades)
	SignalManager.on_surfer_dodge.connect(wrapper)
	SignalManager.on_tetris_line_cleared.connect(wrapper2)
	
	for upgrade in database.upgrades:
		SignalManager.on_upgrade_created.emit(upgrade)

# La señal tiene parámetros pero el método no.
# No sé cómo hacerlo bonito
func wrapper(obstacle : Obstacle):
	check_for_unlocked_upgrades()

# Lo mismo acá
func wrapper2(lines : int):
	check_for_unlocked_upgrades()

func has_purchased_upgrade(upgrade : UpgradeResource):
	return upgrade in purchased_upgrades

func create_upgrade(upgrade : UpgradeResource):
	for element in locked_upgrades:
		if upgrade.id == element.id:
			# Excepciones lol
			get_parent().call("La id "  + str(upgrade.id) + " está ocupada por " + upgrade.upgrade_name + " y " + element.upgrade_name)
	add_upgrade(locked_upgrades, upgrade)
	total_upgrade_count += 1
	#unlock_upgrade(upgrade)



func add_upgrade(array, upgrade : UpgradeResource):
	array.append(upgrade)
	#producer_upgrades.set(upgrade.type, producer_upgrades.get(upgrade.type).append(upgrade))

func remove_upgrade(array, upgrade : UpgradeResource):
	array.erase(upgrade)



func unlock_upgrade(upgrade : UpgradeResource):
	remove_upgrade(locked_upgrades, upgrade)
	add_upgrade(unlocked_upgrades, upgrade)
	SignalManager.on_upgrade_unlocked.emit(upgrade)

func on_producer_purchased(type : ScoreType.type):
	var unlocked = []
	for upgrade in locked_upgrades:
		
		#Solo los producer upgrades hacen algo cuando se compra una producer
		if not upgrade is ScoreBonus:
			continue
		
		#print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
		if upgrade.unlock_condition():
			unlocked.append(upgrade)
	for upgrade in unlocked:
		unlock_upgrade(upgrade)
		

func on_upgrade_purchased(upgrade : UpgradeResource):
	remove_upgrade(unlocked_upgrades, upgrade)
	add_upgrade(purchased_upgrades, upgrade)

func get_additive_bonus(producer : ScoreType.type):
	var total_bonus = 0.0
	for upgrade in purchased_upgrades:
		if upgrade is ScoreBonus and upgrade.type == producer and upgrade.additive:
			total_bonus += upgrade.get_bonus()
	return total_bonus

func get_times_bonus(producer : ScoreType.type):
	
	var total_bonus = 1.0
	
	for upgrade in purchased_upgrades:
		if upgrade is ScoreBonus and upgrade.type == producer and not upgrade.additive:
			total_bonus *= upgrade.get_bonus()
	return total_bonus
	
	

func on_medie_count_changed(_useless_but_needed_param : float):
	var unlocked = []

	for upgrade in locked_upgrades:
			#Solo los minigame unlock upgrades hacen algo cuando se agarran medies
		#if  not (upgrade is MinigameUnlockUpgrade or upgrade is ShowElement or upgrade is Victory):
			#continue
	
		#print(upgrade.upgrade_name + " desbloqueada: " + str(upgrade.unlock_condition()))
		if upgrade.unlock_condition():
			unlocked.append(upgrade)
	
	for upgrade in unlocked:
		unlock_upgrade(upgrade)


#func on_pong_score():
	#var unlocked = []
	#for upgrade in locked_upgrades[ScoreType.type.PONG]:
		#if  not upgrade is PongScoreIncrease:
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
	for upgrade in locked_upgrades:
		if upgrade.unlock_condition():
			unlocked.append(upgrade)
	
	for upgrade in unlocked:
		unlock_upgrade(upgrade)


func get_pong_speed_bonus(player : bool):
	var total_speed_bonus := 1.0
	for upgrade in purchased_upgrades:
		if not upgrade is PongCpuSlowdown:
			continue
		
		total_speed_bonus *= upgrade.get_speed_multiplier()
	return total_speed_bonus
