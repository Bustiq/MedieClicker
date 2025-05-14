extends StaticBody2D

@export var baseSpeed : int
@export var bouncePower : int

var win_height : int 
var p_height : int


func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	baseSpeed = 300
	bouncePower = 300
	pass


func _process(delta):

	
	if Input.is_action_pressed("Move_Up"):
		position.y -= baseSpeed * delta
	elif Input.is_action_pressed("Move_Down"):
		position.y += baseSpeed * delta
		
	global_position.y = clamp(global_position.y, (p_height / 2) + p_height/1.1, (win_height - p_height / 2) - p_height/1.1)
	
	pass		
	
