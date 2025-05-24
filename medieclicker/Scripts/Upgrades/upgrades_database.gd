extends Node

var upgrades = []

func _ready() -> void:
	var better_bread = BuildingUpgrade.new(1, "Mejor pan", "Cada rollo de cocina da +0.005 medies/s", $"../Control/Buildings/".get_child(0), 1, load("res://Sprites/Upgrades/1_Better_bread.png"), 3, 0.005, 1)
	var sesame_seeds = BuildingUpgrade.new(2, "Semillas de sésamo", "Cada rollo de cocina da +0.01 medies/s", $"../Control/Buildings/".get_child(0), 3, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 8, 0.01, 1)
	var thicker_flour = BuildingUpgrade.new(6, "Harina más espesa", "Cada rollo de cocina da +0.04 medies/s", $"../Control/Buildings/".get_child(0), 11, load("res://Sprites/Upgrades/3_Thicker_flour.png"), 20, 0.04, 1)
	var automatic_stirrer = BuildingUpgrade.new(23, "Batidora Automática", "Cada rollo de cocina da +0.05 medies/s", $"../Control/Buildings/".get_child(0), 11, load("res://Sprites/Upgrades/4_Automatic_stirer.png.png"), 35, 0.05, 1)
	
	
	var pong_unlock = MinigameUnlockUpgrade.new(3, "Desbloquear Pong", "Desbloquea el minijuego Pong (Se controla con la rueda del mouse)", ScoreType.type.PONG, 50, load("res://Sprites/pong_icon.png"), 35, $"../Control/PongViewportContainer/PongViewport", "res://Scenes/Minigames/Pong/pong_game.tscn")
	var tetris_unlock = MinigameUnlockUpgrade.new(4, "Desbloquear Tetris", "Desbloquea el minijuego Tetris (Se controla con los botones del mouse, espacio, flecha hacia arriba y C)", ScoreType.type.TETRIS, 200, load("res://Sprites/Upgrades/tetris.png"), 150, $"../Control/TetrisViewportContainer/TetrisViewport", "res://Scenes/Minigames/Tetris/tetris_game.tscn")
	var surfer_unlock = MinigameUnlockUpgrade.new(16, "Violación de copyright", "Desbloquea el minijuego Original (Se controla con click izquierdo y click derecho)", ScoreType.type.SURFER, 5, load("res://Sprites/Upgrades/copyright.png"), 4, $"../Control/SurferViewportContainer/SurferViewport", "res://Scenes/Minigames/Surfer/surfer_game.tscn")
	
	var golazos = PongScoreBonus.new(5, "Golazos", "Cada gol en el pong te da 5 medies más", 15, load("res://Sprites/Upgrades/goal.png"), 5, 5)
	
	var sprinklers = PongSpeedBonus.new(7, "Rociadores", "El enemigo del pong se mueve 30% más lento", 100, load("res://Sprites/Upgrades/Sprinkler.png"), 15, 0.7, false)
	var red_card = PongSpeedBonus.new(8, "Tarjeta roja", "El enemigo del pong se mueve 30% más lento", 200, load("res://Sprites/Upgrades/red_card.png"), 40, 0.7, false)
	
	var pointer = ClickUpgrade.new(9, "Puntero", 2, load("res://Sprites/Upgrades/pointer_border.png"), 100, 0.01)
	var linked_list = ClickUpgrade.new(10, "Lista enlazada", 4, load("res://Sprites/Upgrades/linked_list.png"), 300, 0.02)
	var binary_tree = ClickUpgrade.new(11, "Árbol enlazado", 8, load("res://Sprites/Upgrades/binary_tree.png"), 500, 0.03)
	var clock = ClickUpgrade.new(12, "Reloj", 16, load("res://Sprites/Upgrades/clock.png"), 700, 0.05)
	var stack = ClickUpgrade.new(13, "Pila", 32, load("res://Sprites/Upgrades/stack.png"), 900, 0.05)
	var round_robin = ClickUpgrade.new(14, "Round Robin", 64, load("res://Sprites/Upgrades/round_robin.png"), 1100, 0.08)
	var raid_4 = ClickUpgrade.new(15, "Raid 4", 96, load("res://Sprites/Upgrades/raid_4.png"), 1250, 0.08)
	
	var pencil_sharpener = ClickUpgrade.new(24, "Sacapuntas", 128, load("res://Sprites/Upgrades/sacapuntas.png"), 1500, 0.12)
	var punta_de_espalda = ClickUpgrade.new(25, "Punta de espalda", 160, load("res://Sprites/Upgrades/punta_de_espalda.png"), 1750, 0.15)
	var punta_cana = ClickUpgrade.new(26, "Punta Cana", 192, load("res://Sprites/Upgrades/punta_cana.png"), 2000, 0.2)
	
	var fosforos = BuildingUpgrade.new(27, "Fósforos", "Cada parrilla te da +4.5 medies/s", $"../Control/Buildings/".get_child(1), 250, load("res://Sprites/Upgrades/fosforos.png"), 3, 4.5)
	var encendedor = BuildingUpgrade.new(28, "Encendedor", "Cada parrilla te da +7 medies/s", $"../Control/Buildings/".get_child(1), 600, load("res://Sprites/Upgrades/encendedor.png"), 7, 7)
	var fogata = BuildingUpgrade.new(29, "Fogata", "Cada parrilla te da +10 medies/s", $"../Control/Buildings/".get_child(1), 800, load("res://Sprites/Upgrades/fogata.png"), 12, 10)
	
	
	# var steroids = PongStrengthUpgrade.new()
	# Esteroides: En el pong, empujas la pelota más rápido
	# (Ya están los sprites)
	
	
	
	
	
	var watch_ads = SurferDodgeBonus.new(17, "Mirar anuncios", 10, load("res://Sprites/Upgrades/watch_ads.png"), 25, 0.4)
	var daily_login = SurferDodgeBonus.new(18, "Login diario", 40, load("res://Sprites/Upgrades/daily_login.png"), 75, 0.6)
	var energy_system = SurferDodgeBonus.new(19, "Sistema de energía", 70, load("res://Sprites/Upgrades/energy_system.png"), 125, 0.8)
	
	var experience_with_cubes = TetrisLinesBonus.new(20, "Experiencia con cuadrados", 300, load("res://Sprites/Upgrades/experience_with_cubes.png"), 3, 50)
	var washing_machine = TetrisLinesBonus.new(21, "Lavarropas", 500, load("res://Sprites/Upgrades/washing_machine.png"), 1, 150)
	
	
	var victory = Victory.new(22, "Trofeo", "Gracias por jugar! Agradecimientos especiales a Mateo Fernández por la música", ScoreType.type.OTHER, 5000, load("res://Sprites/Upgrades/medie_clicker.png"), 3500)
	
	
	upgrades = [better_bread, sesame_seeds]
	
	UpgradesManager.create_upgrade(better_bread)
	UpgradesManager.create_upgrade(sesame_seeds)
	UpgradesManager.create_upgrade(thicker_flour)
	UpgradesManager.create_upgrade(automatic_stirrer)
	UpgradesManager.create_upgrade(pong_unlock)
	UpgradesManager.create_upgrade(tetris_unlock)
	UpgradesManager.create_upgrade(surfer_unlock)
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
	UpgradesManager.create_upgrade(watch_ads)
	UpgradesManager.create_upgrade(daily_login)
	UpgradesManager.create_upgrade(energy_system)
	UpgradesManager.create_upgrade(experience_with_cubes)
	UpgradesManager.create_upgrade(washing_machine)
	UpgradesManager.create_upgrade(pencil_sharpener)
	UpgradesManager.create_upgrade(punta_de_espalda)
	UpgradesManager.create_upgrade(punta_cana)
	UpgradesManager.create_upgrade(fosforos)
	UpgradesManager.create_upgrade(encendedor)
	UpgradesManager.create_upgrade(fogata)
	UpgradesManager.create_upgrade(victory)
	
	
	
