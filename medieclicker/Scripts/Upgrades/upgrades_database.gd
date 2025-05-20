extends Node

var upgrades = []

func _ready() -> void:
	var better_bread = BuildingUpgrade.new(1, "Mejor pan", "Cada rollo de cocina da +0.1 medies/s", $"../Control/Buildings/".get_child(0), 1, load("res://Sprites/Upgrades/1_Better_bread.png"), 1, 0.005, 1)
	var sesame_seeds = BuildingUpgrade.new(2, "Semillas de sésamo", "Cada rollo de cocina da +0.5 medies/s", $"../Control/Buildings/".get_child(0), 100, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 10, 0.02, 1)
	var pong_unlock = MinigameUnlockUpgrade.new(3, "Desbloquear Pong", "Desbloquea el minijuego pong (Se controla con la rueda del mouse, +5.0 medies/gol)", ScoreType.type.PONG, 0, load("res://Sprites/pong_icon.png"), 0.75, $"../Control/PongViewportContainer/PongViewport", "res://Scenes/Minigames/Pong/pong_game.tscn")
	var tetris_unlock = MinigameUnlockUpgrade.new(4, "Desbloquear Tetris", "Desbloquea el minijuego tetris", ScoreType.type.TETRIS, 0, load("res://Sprites/Tetris/tetrominoes.png"), 0, $"../Control/TetrisViewportContainer/TetrisViewport", "res://Scenes/Minigames/Tetris/tetris_game.tscn")
	upgrades = [better_bread, sesame_seeds]
	
	UpgradesManager.create_upgrade(better_bread)
	UpgradesManager.create_upgrade(sesame_seeds)
	UpgradesManager.create_upgrade(pong_unlock)
	UpgradesManager.create_upgrade(tetris_unlock)
