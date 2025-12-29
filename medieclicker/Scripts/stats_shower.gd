extends HiddenElement

func update_stats():
	$MedieTotal.text = "Medies totales: " + str(MedieManager.total_medie_count)
	$ClickCount.text = "Medie clicks: " + str(MedieManager.click_count)
	$Dodges.text = "Esquives: " + str(MedieManager.surfer_dodge_count)
	$PongGoals.text = "Pong goles: " + str(MedieManager.pong_goals_count)
	$PongBounces.text = "Pong rebotes: " + str(MedieManager.pong_self_bounce_count)
	$Lines.text = "Tetris lineas: " + str(MedieManager.tetris_lines_cleared)
