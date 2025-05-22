extends Node

var upgrades = []

func _ready() -> void:
	var better_bread = BuildingUpgrade.new(1, "Mejor pan", "Cada rollo de cocina da +0.005 medies/s", $"../Control/Buildings/".get_child(0), 1, load("res://Sprites/Upgrades/1_Better_bread.png"), 3, 0.005, 1)
	var sesame_seeds = BuildingUpgrade.new(2, "Semillas de sésamo", "Cada rollo de cocina da +0.01 medies/s", $"../Control/Buildings/".get_child(0), 3, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 8, 0.01, 1)
	var thicker_flour = BuildingUpgrade.new(6, "Harina más espesa", "Cada rollo de cocina da +0.04 medies/s", $"../Control/Buildings/".get_child(0), 11, load("res://Sprites/Upgrades/3_Thicker_flour.png"), 20, 0.04, 1)
	var pong_unlock = MinigameUnlockUpgrade.new(3, "Desbloquear Pong", "Desbloquea el minijuego pong (Se controla con la rueda del mouse)", ScoreType.type.PONG, 5, load("res://Sprites/pong_icon.png"), 4, $"../Control/PongViewportContainer/PongViewport", "res://Scenes/Minigames/Pong/pong_game.tscn")
	var tetris_unlock = MinigameUnlockUpgrade.new(4, "Desbloquear Tetris", "Desbloquea el minijuego tetris", ScoreType.type.TETRIS, 0, load("res://Sprites/Upgrades/tetris.png"), 0, $"../Control/TetrisViewportContainer/TetrisViewport", "res://Scenes/Minigames/Tetris/tetris_game.tscn")
	
	var golazos = PongScoreBonus.new(5, "Golazos", "Cada gol en el pong te da 5 medies más", 7.5, load("res://Sprites/Upgrades/goal.png"), 5, 5)
	
	var sprinklers = PongSpeedBonus.new(7, "Rociadores", "El enemigo del pong se mueve 30% más lento", 4, load("res://Sprites/Upgrades/Sprinkler.png"), 15, 0.7, false)
	var red_card = PongSpeedBonus.new(8, "Tarjeta roja", "El enemigo del pong se mueve 30% más lento", 10, load("res://Sprites/Upgrades/red_card.png"), 40, 0.7, false)
	
	var pointer = ClickUpgrade.new(9, "Puntero", 2, load("res://Sprites/Upgrades/pointer_border.png"), 100, 0.01)
	var linked_list = ClickUpgrade.new(10, "Lista enlazada", 4, load("res://Sprites/Upgrades/linked_list.png"), 200, 0.02)
	var binary_tree = ClickUpgrade.new(11, "Árbol enlazado", 8, load("res://Sprites/Upgrades/binary_tree.png"), 350, 0.03)
	var clock = ClickUpgrade.new(12, "Reloj", 16, load("res://Sprites/Upgrades/clock.png"), 450, 0.05)
	var stack = ClickUpgrade.new(13, "Pila", 32, load("res://Sprites/Upgrades/stack.png"), 550, 0.05)
	var round_robin = ClickUpgrade.new(14, "Round Robin", 64, load("res://Sprites/Upgrades/round_robin.png"), 650, 0.08)
	var raid_4 = ClickUpgrade.new(15, "Raid 4", 128, load("res://Sprites/Upgrades/raid_4.png"), 750, 0.08)
	# var steroids = PongStrengthUpgrade.new()
	# Esteroides: En el pong, empujas la pelota más rápido
	# (Ya están los sprites)
	
	upgrades = [better_bread, sesame_seeds]
	
	UpgradesManager.create_upgrade(better_bread)
	UpgradesManager.create_upgrade(sesame_seeds)
	UpgradesManager.create_upgrade(thicker_flour)
	UpgradesManager.create_upgrade(pong_unlock)
	#UpgradesManager.create_upgrade(tetris_unlock)
	UpgradesManager.create_upgrade(golazos)
	UpgradesManager.create_upgrade(sprinklers)
	UpgradesManager.create_upgrade(red_card)
	UpgradesManager.create_upgrade(pointer)
	UpgradesManager.create_upgrade(linked_list)
	UpgradesManager.create_upgrade(binary_tree)
	UpgradesManager.create_upgrade(clock)
	UpgradesManager.create_upgrade(stack)
	UpgradesManager.create_upgrade(round_robin)
	UpgradesManager.create_upgrade(raid_4)
