extends Control
class_name Debug

@onready var medies_input: LineEdit = $MediesInput
var is_showing := true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("open_debug"):
		if is_showing:

			hide()
		else:
			show()
		is_showing = not is_showing




func _on_times_100_toggled(toggled_on: bool) -> void:
	MedieManager.times_100 = toggled_on





func _on_times_1000_toggled(toggled_on: bool) -> void:
	MedieManager.times_1000 = toggled_on






func _on_plus_medies_pressed() -> void:
	var input : String = medies_input.text
	if not input.is_valid_float():
		return
	
	var value = float(input)
	
	SignalManager.on_medie_gain.emit(value)
	




func _on_set_medies_pressed() -> void:
	var input : String = medies_input.text
	if not input.is_valid_float():
		return
	
	var value = float(input)
	print(MedieManager.medieCount)
	SignalManager.on_purchase.emit(MedieManager.medieCount)
	SignalManager.on_medie_gain.emit(value)




func _on_unlock_all_pressed() -> void:

	var locked = UpgradesManager.locked_upgrades.duplicate()
	
	for upgradeType in locked:
		var up = locked[upgradeType].duplicate()
		for upgrade in up:
			UpgradesManager.unlock_upgrade(upgrade)


func _on_unlock_pressed() -> void:
	var input : String = medies_input.text
	
	for upgradeType in UpgradesManager.locked_upgrades:
		for upgrade in UpgradesManager.locked_upgrades[upgradeType]:
			if upgrade.upgrade_name.to_lower() == input.to_lower():
				UpgradesManager.unlock_upgrade(upgrade)
				return
	
	
	
	
	if not input.is_valid_int():
		return
	
	var value = int(input)
	
	
	for upgradeType in UpgradesManager.locked_upgrades:
		for upgrade in UpgradesManager.locked_upgrades[upgradeType]:
			if upgrade.id == value:
				UpgradesManager.unlock_upgrade(upgrade)
				return


func _on_plus_dodges_pressed() -> void:
	var input : String = medies_input.text
	if not input.is_valid_int():
		return
	
	var value = int(input)
	
	
	MedieManager.surfer_dodge_count += value - 1
	var node : Obstacle = load("res://Scenes/Minigames/Surfer/barriers.tscn").instantiate()
	SignalManager.on_surfer_dodge.emit(node)


func _on_pause_minigames_pressed() -> void:
	SignalManager.on_upgrade_hovered.emit(Upgrade.new(-1, "vaya", "para pausar los minijuegos es mejor considerar lo debug como una mejora", ScoreType.type.OTHER, 0, load("res://icon.svg"), ""))



func _on_unpause_minigames_pressed() -> void:
	SignalManager.on_upgrade_unhovered.emit()


func _on_plus_a_lot_pressed() -> void:
	SignalManager.on_medie_gain.emit(10000)
	
	print(MedieManager.total_medie_count)


func _on_plus_bounces_pressed() -> void:
	var input : String = medies_input.text
	if not input.is_valid_int():
		return
	
	var value = int(input)
	
	MedieManager.pong_self_bounce_count += value - 1
	SignalManager.on_pong_self_bounce.emit()


func _on_plus_goals_pressed() -> void:
	var input : String = medies_input.text
	if not input.is_valid_int():
		return
	
	var value = int(input)
	
	MedieManager.pong_goals_count += value - 1
	SignalManager.on_pong_score.emit()


func _on_spanish_pressed() -> void:
	TranslationServer.set_locale("es")


func _on_english_pressed() -> void:
	TranslationServer.set_locale("en")
