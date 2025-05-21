extends Node

signal on_price_changed(new_price)
signal on_building_count_changed(new_count)

@export var start_price : float
@export var price_increase_mult : float
@export var building_id : int
@export var building_name : String
@export var increase : float
@export var score_type : ScoreType.type
@export var icon : Texture2D


var building_count = 0

func _ready():
	$Icon.texture_normal = icon


func get_building_increase():
	return (increase + UpgradesManager.get_additive_bonus(score_type)) * building_count

func set_building_count(count : int):
	building_count = count
	on_building_count_changed.emit(building_count)
	on_price_changed.emit(get_final_price())

func get_final_price():
	return round_price(start_price * pow(price_increase_mult, building_count))

func round_price(num):
	const decimal_places = 2
	return (round(num*pow(10,decimal_places)) / pow(10,decimal_places))

func _on_buy_button_pressed() -> void:
	if MedieManager.can_afford(get_final_price()):
		SignalManager.on_purchase.emit(get_final_price())
		building_count += 1
		SignalManager.on_building_purchased.emit(score_type)
		on_building_count_changed.emit(building_count)
		on_price_changed.emit(get_final_price())
