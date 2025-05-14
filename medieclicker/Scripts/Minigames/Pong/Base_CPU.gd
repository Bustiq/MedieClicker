extends StaticBody2D

var ball_pos : Vector2
var BASE_SPEED = 1000
var baseBouncePower = 300
var bouncePower = 400
var bounceSpeed = 100
var dist : int
var move_by : int
var win_height : int
var p_height : int
var isCpu = true

func _ready():
	
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	BASE_SPEED = 500
	baseBouncePower = 300
	
func _process(delta):
	if isCpu:
		ball_pos = $"../Ball".position
		dist = position.y - ball_pos.y
		
		if (abs(dist) > BASE_SPEED * delta):
			move_by = (BASE_SPEED * delta) * (dist / abs(dist))
		else:
				move_by = dist
		if $"../Ball".dir.x > 0:
			position.y	-= move_by
	else:
		if Input.is_action_pressed("ui_up"):
			position.y -= BASE_SPEED * delta
		elif Input.is_action_pressed("ui_down"):
			position.y += BASE_SPEED * delta
		
	global_position.y = clamp(global_position.y, (p_height / 2) + p_height/1.1, (win_height - p_height / 2) - p_height/1.1)
