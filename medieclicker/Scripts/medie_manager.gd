extends Node

var total_medie_count : float = 0
var medieCount : float = 0
var pong_goals_count : int = 0
var pong_self_bounce_count : int = 0
var click_count : int = 0
var surfer_dodge_count : int = 0
var tetris_lines_cleared : int = 0


const debug_mode = false

func _ready() -> void:
	SignalManager.on_purchase.connect(remove_medies)
	SignalManager.on_medie_gain.connect(add_medies)
	SignalManager.on_game_save.connect(send_saved_data)
	SignalManager.on_game_load.connect(load_saved_data)
	SignalManager.on_pong_score.connect(on_pong_score)
	SignalManager.on_pong_self_bounce.connect(on_pong_self_bounce)
	SignalManager.on_medie_clicked.connect(on_medie_clicked)
	SignalManager.on_surfer_dodge.connect(on_surfer_dodge)
	SignalManager.on_tetris_line_cleared.connect(on_tetris_line_cleared)

func on_tetris_line_cleared(lines : int):
	tetris_lines_cleared += lines

func on_surfer_dodge(obstacle : Obstacle):
	surfer_dodge_count += 1

func on_medie_clicked():
	click_count += 1

func on_pong_self_bounce():
	pong_self_bounce_count += 1

func on_pong_score():
	pong_goals_count += 1

func send_saved_data():
	SavedData.total_medies = total_medie_count
	SavedData.current_medies = medieCount

func load_saved_data(save : Save):
	total_medie_count = save.total_medies
	medieCount = save.current_medies
	print(medieCount)
	SignalManager.on_medies_changed.emit(medieCount)


func get_medies():
	return medieCount

func can_afford(price : float):
	return NumberHelper.equals(medieCount, price) or medieCount > price

func remove_medies(count : float):
	medieCount -= count
	if medieCount < 0:
		if medieCount < -0.02:
			$Buildings.esteAtributoNoExistePeroSiEjecutaEstoDebeTirarErrorMalditoGodotComoQueNoHayThrows
		medieCount = 0
	round_medies()
	SignalManager.on_medies_changed.emit(medieCount)


func add_medies(count : float):
	if debug_mode:
		if Input.is_action_pressed("Times_100"):
			count *= 100
		if Input.is_action_pressed("Times_1000"):
			count *= 1000
	medieCount += count
	total_medie_count += count
	round_medies()
	SignalManager.on_medies_changed.emit(medieCount)

func round_medies():
	medieCount = round(medieCount*pow(10,3))/pow(10,3)
	total_medie_count = round(total_medie_count*pow(10,3))/pow(10,3)
