extends Node2D



@onready var sfx_score = $scoreSFX
@onready var pause_Menu = $PauseMenu
var paused = false
var base_pong_score = 3
	

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
	$Player.reset()
	$CPU.reset()
	
	pass # Replace with function body.


func _on_player_scores_body_entered(body: Node2D) -> void:
	
	
	sfx_score.play()
	$BallTimer.start()
	SignalManager.on_pong_loss.emit()
	


func _on_cp_uscores_body_entered(body: Node2D) -> void:
	sfx_score.play()
	$BallTimer.start()
	SignalManager.on_pong_score.emit()

	SignalManager.on_medie_gain.emit(base_pong_score + UpgradesManager.get_additive_bonus(ScoreType.type.PONG))
	
