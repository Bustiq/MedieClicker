extends Control



# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db($"../PauseBackground/MasterSlider".value))
	AudioServer.set_bus_volume_db(1, linear_to_db($"../PauseBackground/MusicSlider".value))
	AudioServer.set_bus_volume_db(3, linear_to_db($"../PauseBackground/SFXSlider".value))
	
	for upgrade in UpgradesManager.database.upgrades:
		on_upgrade_created(upgrade)
	SignalManager.on_uicon_hover.connect(on_uicon_hover)


func on_uicon_hover(upgrade : UpgradeResource):
	var upgrades = $"../PauseBackground/UpgradesBackground/Upgrades".get_children()
	var icon : Node = null
	for uicon in upgrades:
		if uicon.upgrade.id == upgrade.id:
			icon = uicon
			break
	
	if icon == null:
		get_parent().call("Mejora " + upgrade.upgrade_name + " no encontrada")
	
	$"../PauseBackground/UpgradesBackground/UnlockDescription".text = upgrade.get_unlock_description()
	if icon.locked:
		$"../PauseBackground/UpgradesBackground/Name".text = "???"
		$"../PauseBackground/UpgradesBackground/Effect".text = "???"
	else:
		$"../PauseBackground/UpgradesBackground/Name".text = upgrade.upgrade_name
		$"../PauseBackground/UpgradesBackground/Effect".text = upgrade.get_description()


var uicon = "res://Scenes/upgrade_uicon.tscn"
func on_upgrade_created(upgrade : UpgradeResource):
	var instance = load(uicon).instantiate()
	instance.set_upgrade(upgrade)
	$"../PauseBackground/UpgradesBackground/Upgrades".add_child(instance)
	

func _on_unpause_pressed() -> void:
	get_tree().paused = false
	$"../PauseBackground".hide()


func _on_pressed() -> void:
	get_tree().paused = true
	$"../PauseBackground/Stats".update_stats()
	$"../PauseBackground".show()
	




func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	SettingsManager.master_volume = value



func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
	SettingsManager.music_volume = value



func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
	SettingsManager.sfx_volume = value







func _on_upgrades_button_two_pressed() -> void:
	$"../PauseBackground/UpgradesBackground".show()




func _on_back_button_two_pressed() -> void:
	$"../PauseBackground/UpgradesBackground".hide()


func _on_pause_minigames_toggled(toggled_on: bool) -> void:
	SettingsManager.pause_minigames = toggled_on
