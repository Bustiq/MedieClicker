extends Node
class_name Producer

signal on_price_changed(new_price)
signal on_producer_count_changed(new_count)

@export var start_price : float
@export var price_increase_mult : float
@export var producer_id : int
@export var producer_name : String
@export var increase : float
@export var score_type : ScoreType.type
@export var icon : Texture2D


var producer_count = 0

func _ready():
	MedieManager.add_producer(self)
	$Icon.texture_normal = icon



func get_producer_increase():
	return (increase + UpgradesManager.get_additive_bonus(score_type)) * producer_count * UpgradesManager.get_times_bonus(score_type)

func set_producer_count(count : int):
	producer_count = count
	on_producer_count_changed.emit(producer_count)
	on_price_changed.emit(get_final_price())

func get_final_price():
	return round_price(start_price * pow(price_increase_mult, producer_count))

func round_price(num):
	const decimal_places = 2
	return (round(num*pow(10,decimal_places)) / pow(10,decimal_places))

func _on_buy_button_pressed() -> void:
	if MedieManager.can_afford(get_final_price()):
		SignalManager.on_purchase.emit(get_final_price())
		producer_count += 1
		SignalManager.on_producer_purchased.emit(score_type)
		on_producer_count_changed.emit(producer_count)
		on_price_changed.emit(get_final_price())
