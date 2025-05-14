extends Node2D

var score := [0, 0]


@onready var sfx_score = $scoreSFX
@onready var pause_Menu = $PauseMenu
var paused = false

	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()
	
		pass
		
func pauseMenu():
	if paused:
		pause_Menu.hide()
		Engine.time_scale = 1
	else:
		pause_Menu.show()
		Engine.time_scale = 0
	paused = !paused
	
	
	
func _on_ball_timer_timeout():
	$Ball.new_ball()
	
	pass # Replace with function body.


func _on_player_scores_body_entered(body: Node2D) -> void:
	
	score[0] += 1
	$Hud/PlayerScore.text = str(score[0])
	
	sfx_score.play()
	$BallTimer.start()
	
	
	pass # Replace with function body.


func _on_cp_uscores_body_entered(body: Node2D) -> void:
	score[1] += 1
	sfx_score.play()
	$Hud/CPUscore.text = str(score[1])
	$BallTimer.start()
