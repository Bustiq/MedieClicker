extends Node

var upgrades = []

func _ready() -> void:
	#var better_bread = ProducerUpgrade.new(1, "BREAD", "Cada rollo de cocina da +0.005 medies/s (Es el doble!)", $"../Control/Producers/".get_child(0), 1, load("res://Sprites/Upgrades/1_Better_bread.png"), 3, 0.005, 1)
	#var sesame_seeds = ProducerUpgrade.new(2, "SEEDS", "Cada rollo de cocina da +0.01 medies/s", $"../Control/Producers/".get_child(0), 3, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 8, 0.01, 1)
	#var thicker_flour = ProducerUpgrade.new(6, "FLOUR", "Cada rollo de cocina da +0.04 medies/s", $"../Control/Producers/".get_child(0), 11, load("res://Sprites/Upgrades/3_Thicker_flour.png"), 20, 0.04, 1)
	#var automatic_stirrer = ProducerUpgrade.new(23, "STIRRER", "Cada rollo de cocina da +0.05 medies/s", $"../Control/Producers/".get_child(0), 11, load("res://Sprites/Upgrades/4_Automatic_stirer.png"), 35, 0.05, 1)
	var better_bread = ProducerUpgrade.new(1, "BREAD", "Cada rollo de cocina produce el doble", $"../Control/Producers/".get_child(0), 0.35, load("res://Sprites/Upgrades/Better_bread.png"), 3, 0, 2)
	var sesame_seeds = ProducerUpgrade.new(2, "SEEDS", "Cada rollo de cocina da +0.01 medies/s", $"../Control/Producers/".get_child(0), 1, load("res://Sprites/Upgrades/Sesame_seeds.png"), 6, 0.01, 1)
	var thicker_flour = ProducerUpgrade.new(6, "FLOUR", "Cada rollo de cocina da +0.04 medies/s", $"../Control/Producers/".get_child(0), 3, load("res://Sprites/Upgrades/Thicker_flour.png"), 10, 0.04, 1)
	var automatic_stirrer = ProducerUpgrade.new(23, "STIRRER", "Cada rollo de cocina da +0.05 medies/s", $"../Control/Producers/".get_child(0), 11, load("res://Sprites/Upgrades/Automatic_stirer.png"), 15, 0.05, 1)
	
	

	var options_unlock = ShowElement.new(34, "SETTINGS", "¿Querés bajarle el volúmen bro?", 0.5, load("res://Sprites/Upgrades/options.png"), 0.5, $"../Control/Settings")
	var stats = ShowElement.new(36, "STATS", "Te muestra estadísticas de la partida (en opciones)", 70, load("res://Sprites/Upgrades/stats.png"), 70, $"../Control/Settings/PauseBackground/Stats")
	var info = ShowElement.new(35, "INFO", "Te dice cómo desbloquear las mejoras faltantes (en opciones)", 200, load("res://Sprites/Upgrades/info.png"), 200, $"../Control/Settings/PauseBackground/UpgradesButtonTwo")
	
	var pong_unlock = MinigameUnlockUpgrade.new(3, "PONG", "Desbloquea el minijuego Pong (Se controla con la rueda del mouse)", ScoreType.type.PONG, 15, load("res://Sprites/pong_icon.png"), 15, $"../Control/PongViewportContainer/PongViewport", "res://Scenes/Minigames/Pong/pong_game.tscn", [$"../Control/Settings/PauseBackground/Stats/PongGoals", $"../Control/Settings/PauseBackground/Stats/PongBounces"])
	var tetris_unlock = MinigameUnlockUpgrade.new(4, "TETRIS", "Desbloquea el minijuego Tetris (Se controla con los botones del mouse, espacio, flecha hacia arriba y C)", ScoreType.type.TETRIS, 1500, load("res://Sprites/Upgrades/tetris.png"), 1250, $"../Control/TetrisViewportContainer/TetrisViewport", "res://Scenes/Minigames/Tetris/tetris_game.tscn", [$"../Control/Settings/PauseBackground/Stats/Lines"])
	var surfer_unlock = MinigameUnlockUpgrade.new(16, "BRAINROT", "Desbloquea el minijuego Original (Se controla con click izquierdo y click derecho)", ScoreType.type.SURFER, 2, load("res://Sprites/Upgrades/copyright.png"), 1, $"../Control/SurferViewportContainer/SurferViewport", "res://Scenes/Minigames/Surfer/surfer_game.tscn", [$"../Control/Settings/PauseBackground/Stats/Dodges"])

	
	
	var golazos = PongScoreIncrease.new(5, "GOAL", "Medies/gol x2", 15, load("res://Sprites/Upgrades/goal.png"), 5, 20)
	
	var sprinklers = PongSpeedBonus.new(7, "SPRINKLER", "El enemigo del pong se mueve 30% más lento", 100, load("res://Sprites/Upgrades/Sprinkler.png"), 15, 0.7, false)
	var red_card = PongSpeedBonus.new(8, "RED_CARD", "El enemigo del pong se mueve 30% más lento", 200, load("res://Sprites/Upgrades/red_card.png"), 40, 0.7, false)
	
	#var pointer = ClickUpgrade.new(9, "CLICK1", 2, load("res://Sprites/Upgrades/pointer_border.png"), 100, 0.01)
	#var linked_list = ClickUpgrade.new(10, "CLICK2", 4, load("res://Sprites/Upgrades/linked_list.png"), 300, 0.02)
	#var binary_tree = ClickUpgrade.new(11, "CLICK3", 8, load("res://Sprites/Upgrades/binary_tree.png"), 400, 0.03)
	#var clock = ClickUpgrade.new(12, "CLICK4", 16, load("res://Sprites/Upgrades/clock.png"), 500, 0.05)
	#var stack = ClickUpgrade.new(13, "CLICK5", 32, load("res://Sprites/Upgrades/stack.png"), 650, 0.05)
	#var round_robin = ClickUpgrade.new(14, "CLICK6", 64, load("res://Sprites/Upgrades/round_robin.png"), 850, 0.08)
	#var raid_4 = ClickUpgrade.new(15, "CLICK7", 96, load("res://Sprites/Upgrades/raid_4.png"), 1050, 0.08)
	
	var pointer = ClickUpgrade.new(9, "CLICK1", 0.5, load("res://Sprites/Upgrades/pointer_border.png"), 50, 0.01)
	var linked_list = ClickUpgrade.new(10, "CLICK2", 4, load("res://Sprites/Upgrades/linked_list.png"), 160, 0.02)
	var binary_tree = ClickUpgrade.new(11, "CLICK3", 8, load("res://Sprites/Upgrades/binary_tree.png"), 400, 0.03)
	var clock = ClickUpgrade.new(12, "CLICK4", 16, load("res://Sprites/Upgrades/clock.png"), 500, 0.05)
	var stack = ClickUpgrade.new(13, "CLICK5", 32, load("res://Sprites/Upgrades/stack.png"), 650, 0.05)
	var round_robin = ClickUpgrade.new(14, "CLICK6", 64, load("res://Sprites/Upgrades/round_robin.png"), 850, 0.08)
	var raid_4 = ClickUpgrade.new(15, "CLICK7", 96, load("res://Sprites/Upgrades/raid_4.png"), 1050, 0.08)

	var pencil_sharpener = ClickUpgrade.new(24, "CLICK8", 128, load("res://Sprites/Upgrades/sacapuntas.png"), 1300, 0.12)
	var punta_de_espalda = ClickUpgrade.new(25, "CLICK9", 160, load("res://Sprites/Upgrades/punta_de_espalda.png"), 1500, 0.15)
	var punta_cana = ClickUpgrade.new(26, "CLICK10", 192, load("res://Sprites/Upgrades/punta_cana.png"), 1700, 0.2)
	
	var fosforos = ProducerUpgrade.new(27, "MATCHES", "Cada parrilla te da +4.5 medies/s", $"../Control/Producers/".get_child(1), 600, load("res://Sprites/Upgrades/fosforos.png"), 3, 4.5)
	var encendedor = ProducerUpgrade.new(28, "LIGHTER", "Cada parrilla te da +7 medies/s", $"../Control/Producers/".get_child(1), 1000, load("res://Sprites/Upgrades/encendedor.png"), 7, 7)
	var fogata = ProducerUpgrade.new(29, "CAMP", "Cada parrilla te da +10 medies/s", $"../Control/Producers/".get_child(1), 1700, load("res://Sprites/Upgrades/fogata.png"), 12, 10)
	
	
	# var steroids = PongStrengthUpgrade.new()
	# Esteroides: En el pong, empujas la pelota más rápido
	# (Ya están los sprites)
	
	
	
	
	
	var watch_ads = SurferDodgeBonus.new(17, "ADS", 5, load("res://Sprites/Upgrades/watch_ads.png"), 5, 0.1)
	var daily_login = SurferDodgeBonus.new(18, "DAILY", 30, load("res://Sprites/Upgrades/daily_login.png"), 50, 0.6)
	var energy_system = SurferDodgeBonus.new(19, "ENERGY", 50, load("res://Sprites/Upgrades/energy_system.png"), 75, 1.2)
	var microtransaccions = SurferDodgeBonus.new(31, "IAP", 70, load("res://Sprites/Upgrades/microtransactions.png"), 130, 3)
	var lootbox = SurferDodgeBonus.new(32, "LOOTBOX", 200, load("res://Sprites/Upgrades/lootboxes.png"), 155,7)
	var multiple_currencies = SurferDodgeBonus.new(33, "CURRENCIES", 400, load("res://Sprites/Upgrades/multiple_currencies.png"), 180, 8)
	var rigged_matchmaking = SurferDodgeBonus.new(30, "RIGGED", 600, load("res://Sprites/Upgrades/rigged_matchmaking.png"), 220, 10)
	
	var experience_with_cubes = TetrisLinesBonus.new(20, "3D", 300, load("res://Sprites/Upgrades/experience_with_cubes.png"), 1, 50)
	var washing_machine = TetrisLinesBonus.new(21, "WASHING", 500, load("res://Sprites/Upgrades/washing_machine.png"), 3, 150)
	
	
	var victory = Victory.new(22, "TROPHY", "Gracias por jugar! Agradecimientos especiales a Mateo Fernández por la música", ScoreType.type.OTHER, 5000, load("res://Sprites/Upgrades/medie_clicker.png"), 3500)
	
	
	SignalManager.on_upgrade_created.emit(options_unlock)
	SignalManager.on_upgrade_created.emit(stats)
	SignalManager.on_upgrade_created.emit(info)
	
	SignalManager.on_upgrade_created.emit(pointer)
	SignalManager.on_upgrade_created.emit(linked_list)
	SignalManager.on_upgrade_created.emit(binary_tree)
	SignalManager.on_upgrade_created.emit(clock)
	SignalManager.on_upgrade_created.emit(stack)
	SignalManager.on_upgrade_created.emit(round_robin)
	SignalManager.on_upgrade_created.emit(raid_4)
	SignalManager.on_upgrade_created.emit(pencil_sharpener)
	SignalManager.on_upgrade_created.emit(punta_de_espalda)
	SignalManager.on_upgrade_created.emit(punta_cana)
	
	SignalManager.on_upgrade_created.emit(better_bread)
	SignalManager.on_upgrade_created.emit(sesame_seeds)
	SignalManager.on_upgrade_created.emit(thicker_flour)
	SignalManager.on_upgrade_created.emit(automatic_stirrer)
	
	SignalManager.on_upgrade_created.emit(fosforos)
	SignalManager.on_upgrade_created.emit(encendedor)
	SignalManager.on_upgrade_created.emit(fogata)
	
	SignalManager.on_upgrade_created.emit(surfer_unlock)
	SignalManager.on_upgrade_created.emit(watch_ads)
	SignalManager.on_upgrade_created.emit(daily_login)
	SignalManager.on_upgrade_created.emit(energy_system)
	SignalManager.on_upgrade_created.emit(microtransaccions)
	SignalManager.on_upgrade_created.emit(lootbox)
	SignalManager.on_upgrade_created.emit(multiple_currencies)
	SignalManager.on_upgrade_created.emit(rigged_matchmaking)
	
	SignalManager.on_upgrade_created.emit(pong_unlock)
	SignalManager.on_upgrade_created.emit(sprinklers)
	SignalManager.on_upgrade_created.emit(red_card)
	SignalManager.on_upgrade_created.emit(golazos)
	
	SignalManager.on_upgrade_created.emit(tetris_unlock)
	SignalManager.on_upgrade_created.emit(experience_with_cubes)
	SignalManager.on_upgrade_created.emit(washing_machine)
	
	SignalManager.on_upgrade_created.emit(victory)
	
	
	
