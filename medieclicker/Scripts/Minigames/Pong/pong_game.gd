extends Node2D



@onready var sfx_score = $scoreSFX

var base_pong_score = 20
	



	
func _on_ball_timer_timeout():
	$Ball.new_ball()
	$Player.reset()
	$CPU.reset()
	
	pass # Replace with function body.


func _on_player_scores_body_entered(body: Node2D) -> void:
	
	
	sfx_score.play()
	$BallTimer.start()
	


func _on_cp_uscores_body_entered(body: Node2D) -> void:
	sfx_score.play()
	$BallTimer.start()
	SignalManager.on_pong_score.emit()

	SignalManager.on_medie_gain.emit(base_pong_score + UpgradesManager.get_additive_bonus(ScoreType.type.PONG))
	
