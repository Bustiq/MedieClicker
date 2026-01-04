extends Node2D

var gain = 0.1

func _ready() -> void:
	SignalManager.on_surfer_dodge.connect(on_surfer_dodge)
	SignalManager.on_upgrade_hovered.connect(on_upgrade_hovered)
	SignalManager.on_upgrade_unhovered.connect(on_upgrade_unhovered)


@export var pause_dodge : UpgradeResource
func on_upgrade_hovered(upgrade : UpgradeResource):
	if UpgradesManager.has_purchased_upgrade(pause_dodge) and SettingsManager.pause_minigames:
		SignalManager.on_surfer_game_pause.emit(true)

func on_upgrade_unhovered():
	if UpgradesManager.has_purchased_upgrade(pause_dodge) and SettingsManager.pause_minigames:
		SignalManager.on_surfer_game_pause.emit(false)

#Si se quiere, eventualmente cada tipo de obstáculo
#te puede dar un aumento diferente o tener diferentes mejoras

#Ahora que lo pienso sería más complicado en realidad porque
#Debería también cambiar el texto (lo que te dice cuanto ganas)
func on_surfer_dodge(obstacle : Obstacle):
	
	SignalManager.on_medie_gain.emit(UpgradesManager.get_total_bonus(gain, ScoreType.type.SURFER))
