extends Node

var upgrades = []

func _ready() -> void:
	var better_bread = BuildingUpgrade.new(1, "Mejor pan", "Cada rollo de cocina da +0.005 medies/s", $"../Control/Buildings/".get_child(0), 1, load("res://Sprites/Upgrades/1_Better_bread.png"), 3, 0.005, 1)
	var sesame_seeds = BuildingUpgrade.new(2, "Semillas de sésamo", "Cada rollo de cocina da +0.02 medies/s", $"../Control/Buildings/".get_child(0), 3, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 10, 0.02, 1)
	var thicker_flour = BuildingUpgrade.new(6, "Herina más espesa", "Cada rollo de cocina da +0.07 medies/s", $"../Control/Buildings/".get_child(0), 25, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 100, 0.07, 1)
	var pong_unlock = MinigameUnlockUpgrade.new(3, "Desbloquear Pong", "Desbloquea el minijuego pong (Se controla con la rueda del mouse)", ScoreType.type.PONG, 5, load("res://Sprites/pong_icon.png"), 2, $"../Control/PongViewportContainer/PongViewport", "res://Scenes/Minigames/Pong/pong_game.tscn")
	var tetris_unlock = MinigameUnlockUpgrade.new(4, "Desbloquear Tetris", "Desbloquea el minijuego tetris", ScoreType.type.TETRIS, 0, load("res://Sprites/Upgrades/tetris.png"), 0, $"../Control/TetrisViewportContainer/TetrisViewport", "res://Scenes/Minigames/Tetris/tetris_game.tscn")
	
	var goalier_goals = PongScoreBonus.new(5, "Goles más goleros", "Cada gol en el pong te da 1.5 medies más", 7.5, load("res://Sprites/Upgrades/goal.png"), 5, 1.5)
	
	
	# Esteroides: En el pong, empujas la pelota más rápido
	# Rociadores: En el pong, el enemigo se mueve más lento
	# (Ya están los sprites)
	
	upgrades = [better_bread, sesame_seeds]
	
	UpgradesManager.create_upgrade(better_bread)
	UpgradesManager.create_upgrade(sesame_seeds)
	UpgradesManager.create_upgrade(thicker_flour)
	UpgradesManager.create_upgrade(pong_unlock)
	#UpgradesManager.create_upgrade(tetris_unlock)
	UpgradesManager.create_upgrade(goalier_goals)
