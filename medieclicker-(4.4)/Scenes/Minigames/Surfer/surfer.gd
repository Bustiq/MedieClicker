extends Sprite2D

var column = 0
const RAIL_SEPARATION = 48
var start_x_pos
var paused := false

func _ready() -> void:
	start_x_pos = position.x
	SignalManager.on_surfer_game_pause.connect(on_surfer_game_pause)

func on_surfer_game_pause(_paused : bool):
	paused = _paused

func _input(event: InputEvent) -> void:
	if paused:
		return
	
	if event.is_action_pressed("Move_Left"):
		if column > -1:
			column -= 1
			update_position()
		
	if event.is_action_pressed("Move_Right"):
		if column < 1:
			column += 1
			update_position()


func update_position():
	position.x = start_x_pos + RAIL_SEPARATION * column


const SAFE_ZONE = 16
const OBSTACLE = 15

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_collision_layer_value(SAFE_ZONE) and area is SafeZone:
		SignalManager.on_surfer_dodge.emit(area.get_dodged_obstacle())
	elif area.get_collision_layer_value(OBSTACLE):
		SignalManager.on_surfer_death.emit()
