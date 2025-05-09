extends Node

signal on_bought(new_price)

@export var start_price : float
@export var price_increase_mult : float
@export var building_id : int
@export var building_name : String
@export var increase : float
@export var score_type : ScoreType.type
@export var icon : Texture2D


var building_count = 0


func get_final_price():
	return round_price(start_price * pow(price_increase_mult, building_count))

func round_price(num):
	const decimal_places = 2
	return (round(num*pow(10,decimal_places)) / pow(10,decimal_places))

func _on_buy_button_pressed() -> void:
	print("buying")
	building_count += 1
	on_bought.emit(get_final_price())
