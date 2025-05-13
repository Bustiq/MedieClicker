extends Node2D

var mps : float = 0
var mpc : float = 0.01
var buildings := []
var upgrades := []

const debug_mode = true

func _ready() -> void:
	SignalManager.on_medie_clicked.connect(on_click)
	for child in $Buildings.get_children():
		buildings.append(child)



func on_click():
	SignalManager.on_medie_gain.emit(get_medies_with_bonus(mpc, ScoreType.type.CLICK))




func get_medies_with_bonus(medies : float, type : ScoreType.type):
	#Mejoras, blah
	return medies



func _on_timer_timeout() -> void:
	var total = 0.0
	for building in buildings:
		if building.get_building_increase() != 0:
			#add_medies(get_medies_with_bonus(building.get_building_increase(), building.score_type))
			total += get_medies_with_bonus(building.get_building_increase(), building.score_type)
	if total != 0:
		SignalManager.on_medie_gain.emit(total)
