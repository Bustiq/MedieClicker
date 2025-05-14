extends CharacterBody2D

var win_size : Vector2
const START_SPEED = 200
var dir : Vector2
@export var speed : int
const MAX_Y_VECTOR = 100
var col = Color(23, 43 , 123)
@onready var sfx_paddleBounce = $PaddleBounce
@onready var sfx_wallBounce = $WallBounce
func _ready():
	$BallRect.color = col
	win_size = get_viewport_rect().size
	

func random_color():
	$BallRect.color = Color(randf(),randf(),randf(),1)
	
	
	

	
func new_ball():

	speed = START_SPEED
	dir = random_direction()
	position.x = -20
	position.y = 2
	
	
func _physics_process(delta):
	
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		random_color()	
		collider = collision.get_collider()
		if collider == 	$"../Player":
			sfx_paddleBounce.play()
			$"../Player".bouncePower += $"../Player".bouncePower * 0.15
			speed = $"../Player".bouncePower
			dir = new_direction(collider)
			
			
		elif collider == $"../CPU":
			sfx_paddleBounce.play()
			$"../CPU".bouncePower += $"../CPU".bouncePower * 0.15
			speed =  $"../CPU".bouncePower
			dir = new_direction(collider)
			
		else:
			dir = dir.bounce(collision.get_normal())
			sfx_wallBounce.play()

	
		
	  
	
		
		
		
func random_direction():
	var new_direction := Vector2()
	new_direction.x = [1, -1].pick_random()
	new_direction.y = randf_range(-1, 1)
	return new_direction.normalized()


	
	
func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (dist/ (collider.p_height / 2)) * 0.6
	return new_dir.normalized()
