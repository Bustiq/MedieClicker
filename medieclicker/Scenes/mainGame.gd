extends Node2D
var medieCount : float = 0
var mps : float = 0
var mpc : float = 0.01
var buildings := []
var upgrades := []

const debug_mode = true

func _ready() -> void:
	SignalManager.on_medie_clicked.connect(on_click)
	SignalManager.on_purchase.connect(remove_medies)
	for child in $Buildings.get_children():
		buildings.append(child)

func remove_medies(count : float):
	medieCount -= count
	if medieCount < 0:
		if medieCount < -0.02:
			$Buildings.esteAtributoNoExistePeroSiEjecutaEstoDebeTirarErrorMalditoGodotComoQueNoHayThrows
		medieCount = 0
	SignalManager.on_medies_changed.emit(medieCount)
	

func on_click():
	add_medies(get_medies_with_bonus(mpc, ScoreType.type.CLICK))
	

func add_medies(count : float):
	if debug_mode and Input.is_action_pressed("ui_accept"):
		count *= 100
	medieCount += count
	SignalManager.on_medies_changed.emit(medieCount)

func get_medies_with_bonus(medies : float, type : ScoreType.type):
	#Mejoras, blah
	return medies



func _on_timer_timeout() -> void:
	var total = 0.0
	for building in buildings:
		if building.get_building_increase() != 0:
			#add_medies(get_medies_with_bonus(building.get_building_increase(), building.score_type))
			total += get_medies_with_bonus(building.get_building_increase(), building.score_type)
	add_medies(total)
