extends Node

var total_medie_count : float = 0
var medieCount : float = 0

const debug_mode = true

func _ready() -> void:
	SignalManager.on_purchase.connect(remove_medies)
	SignalManager.on_medie_gain.connect(add_medies)

func get_medies():
	return medieCount

func can_afford(price : float):
	return  NumberHelper.equals(medieCount,  price) or medieCount > price

func remove_medies(count : float):
	medieCount -= count
	if medieCount < 0:
		if medieCount < -0.02:
			$Buildings.esteAtributoNoExistePeroSiEjecutaEstoDebeTirarErrorMalditoGodotComoQueNoHayThrows
		medieCount = 0
	SignalManager.on_medies_changed.emit(medieCount)


func add_medies(count : float):
	if debug_mode and Input.is_action_pressed("ui_accept"):
		count *= 100
	medieCount += count
	total_medie_count += count
	SignalManager.on_medies_changed.emit(medieCount)
