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
var speed_mult = 1.0

func reset():
	bouncePower = baseBouncePower

func _ready():
	
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	BASE_SPEED = 500

	baseBouncePower = bouncePower
	SignalManager.on_upgrade_purchased.connect(update_speed)

func update_speed(upgrade : Upgrade):
	speed_mult = UpgradesManager.get_pong_speed_bonus(false)

func _process(delta):
	print(speed_mult, " ", BASE_SPEED * speed_mult)
	if isCpu:
		ball_pos = $"../Ball".position
		dist = position.y - ball_pos.y
		
		if (abs(dist) > BASE_SPEED * speed_mult * delta):
			move_by = (BASE_SPEED * speed_mult * delta) * (dist / abs(dist))
		else:
				move_by = dist
		if $"../Ball".dir.x > 0:
			position.y	-= move_by
	else:
		if Input.is_action_pressed("ui_up"):
			position.y -= BASE_SPEED * speed_mult * delta
		elif Input.is_action_pressed("ui_down"):
			position.y += BASE_SPEED * speed_mult * delta
		
	global_position.y = clamp(global_position.y, (p_height / 2) + p_height/1.1, (win_height - p_height / 2) - p_height/1.1)
