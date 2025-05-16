extends Node

var total_medies := 0.0
var current_medies := 0.0
var purchased_upgrades := []
var purchased_buildings := []
var saved_data : Save

func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(on_upgrade_purchased)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		save()
	elif event.is_action_pressed("Move_Down"):
		load_saved_data()
	elif event.is_action_pressed("Move_Up"):
		test_load()

func save():
	SignalManager.on_game_save.emit()
	print(total_medies)
	print(current_medies)
	print(purchased_upgrades)
	print(purchased_buildings)
	saved_data = Save.new(total_medies, current_medies, purchased_upgrades, purchased_buildings)

func load_saved_data():
	print("Loading...")
	SignalManager.on_game_load.emit(saved_data)
	print(SignalManager.on_game_load.get_connections())

func test_load():
	var temp = Save.new(199, 199, [1, 2], [12, 4])
	SignalManager.on_game_load.emit(temp)


func on_upgrade_purchased(upgrade : Upgrade):
	purchased_upgrades.append(upgrade.get_id())
