extends StaticBody2D

@export var baseSpeed : int
@export var bouncePower : int

var win_height : int 
var p_height : int

var delt := 0.0

func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	baseSpeed = 3000
	bouncePower = 300
	pass


func _input(event: InputEvent) -> void:

	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				print("ALTO")
				position.y -= baseSpeed * delt
			if event.button_index ==  MOUSE_BUTTON_WHEEL_DOWN:
				print("BAJO")
				position.y += baseSpeed * delt
				print(delt)




func _process(delta):
	delt = delta
	global_position.y = clamp(global_position.y, (p_height / 2) + p_height/1.1, (win_height - p_height / 2) - p_height/1.1)
