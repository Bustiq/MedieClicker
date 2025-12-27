extends StaticBody2D

@export var baseSpeed : int
@export var bouncePower : int
var start_bounce_power : int

var win_height : int 
var p_height : int

var delt := 0.0
var paused := false

func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	baseSpeed = 3000
	bouncePower = 300
	start_bounce_power = bouncePower
	
	SignalManager.on_pong_game_pasue.connect(on_pong_game_pasue)

func on_pong_game_pasue(_paused : bool):
	paused = _paused


func _input(event: InputEvent) -> void:
	if paused:
		return
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				position.y -= baseSpeed * delt
			if event.button_index ==  MOUSE_BUTTON_WHEEL_DOWN:
				position.y += baseSpeed * delt


func reset():
	bouncePower = start_bounce_power

func _process(delta):
	delt = delta
	global_position.y = clamp(global_position.y, (p_height / 2) + p_height/1.1, (win_height - p_height / 2) - p_height/1.1)
