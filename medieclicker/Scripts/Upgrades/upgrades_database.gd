extends Node

var upgrades = []

func _ready() -> void:
	var better_bread = BuildingUpgrade.new(1, "Mejor pan", "Cada rollo de cocina da +0.005 medies/s (Es el doble!)", $"../Control/Buildings/".get_child(0), 1, load("res://Sprites/Upgrades/1_Better_bread.png"), 3, 0.005, 1)
	var sesame_seeds = BuildingUpgrade.new(2, "Semillas de sésamo", "Cada rollo de cocina da +0.01 medies/s", $"../Control/Buildings/".get_child(0), 3, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 8, 0.01, 1)
	var thicker_flour = BuildingUpgrade.new(6, "Harina más espesa", "Cada rollo de cocina da +0.04 medies/s", $"../Control/Buildings/".get_child(0), 11, load("res://Sprites/Upgrades/3_Thicker_flour.png"), 20, 0.04, 1)
	var automatic_stirrer = BuildingUpgrade.new(23, "Batidora Automática", "Cada rollo de cocina da +0.05 medies/s", $"../Control/Buildings/".get_child(0), 11, load("res://Sprites/Upgrades/4_Automatic_stirer.png"), 35, 0.05, 1)
	
	
	#Para que hacer una clase nueva?
	var options_unlock = ShowElement.new(34, "Desbloquear opciones", "¿Querés bajarle el volúmen bro?", 0.5, load("res://Sprites/Upgrades/options.png"), 1.5, $"../Settings")
	var upgrade_count = ShowElement.new(35, "Mostrar progreso", "Te muestra la cantidad de mejoras compradas y totales (en la esquina)", 200, load("res://Sprites/Upgrades/progress.png"), 500,  $"../UpgradeCount")
	
	var pong_unlock = MinigameUnlockUpgrade.new(3, "Desbloquear Pong", "Desbloquea el minijuego Pong (Se controla con la rueda del mouse)", ScoreType.type.PONG, 50, load("res://Sprites/pong_icon.png"), 35, $"../Control/PongViewportContainer/PongViewport", "res://Scenes/Minigames/Pong/pong_game.tscn")
	var tetris_unlock = MinigameUnlockUpgrade.new(4, "Desbloquear Tetris", "Desbloquea el minijuego Tetris (Se controla con los botones del mouse, espacio, flecha hacia arriba y C)", ScoreType.type.TETRIS, 1500, load("res://Sprites/Upgrades/tetris.png"), 1250, $"../Control/TetrisViewportContainer/TetrisViewport", "res://Scenes/Minigames/Tetris/tetris_game.tscn")
	var surfer_unlock = MinigameUnlockUpgrade.new(16, "Violación de copyright", "Desbloquea el minijuego Original (Se controla con click izquierdo y click derecho)", ScoreType.type.SURFER, 5, load("res://Sprites/Upgrades/copyright.png"), 4, $"../Control/SurferViewportContainer/SurferViewport", "res://Scenes/Minigames/Surfer/surfer_game.tscn")

	
	
	var golazos = PongScoreBonus.new(5, "Golazos", "Cada gol en el pong te da 5 medies más", 15, load("res://Sprites/Upgrades/goal.png"), 5, 5)
	
	var sprinklers = PongSpeedBonus.new(7, "Rociadores", "El enemigo del pong se mueve 30% más lento", 100, load("res://Sprites/Upgrades/Sprinkler.png"), 15, 0.7, false)
	var red_card = PongSpeedBonus.new(8, "Tarjeta roja", "El enemigo del pong se mueve 30% más lento", 200, load("res://Sprites/Upgrades/red_card.png"), 40, 0.7, false)
	
	var pointer = ClickUpgrade.new(9, "Puntero", 2, load("res://Sprites/Upgrades/pointer_border.png"), 100, 0.01)
	var linked_list = ClickUpgrade.new(10, "Lista enlazada", 4, load("res://Sprites/Upgrades/linked_list.png"), 300, 0.02)
	var binary_tree = ClickUpgrade.new(11, "Árbol enlazado", 8, load("res://Sprites/Upgrades/binary_tree.png"), 400, 0.03)
	var clock = ClickUpgrade.new(12, "Reloj", 16, load("res://Sprites/Upgrades/clock.png"), 500, 0.05)
	var stack = ClickUpgrade.new(13, "Pila", 32, load("res://Sprites/Upgrades/stack.png"), 650, 0.05)
	var round_robin = ClickUpgrade.new(14, "Round Robin", 64, load("res://Sprites/Upgrades/round_robin.png"), 850, 0.08)
	var raid_4 = ClickUpgrade.new(15, "Raid 4", 96, load("res://Sprites/Upgrades/raid_4.png"), 1050, 0.08)
	
	var pencil_sharpener = ClickUpgrade.new(24, "Sacapuntas", 128, load("res://Sprites/Upgrades/sacapuntas.png"), 1300, 0.12)
	var punta_de_espalda = ClickUpgrade.new(25, "Punta de espalda", 160, load("res://Sprites/Upgrades/punta_de_espalda.png"), 1500, 0.15)
	var punta_cana = ClickUpgrade.new(26, "Punta Cana", 192, load("res://Sprites/Upgrades/punta_cana.png"), 1700, 0.2)
	
	var fosforos = BuildingUpgrade.new(27, "Fósforos", "Cada parrilla te da +4.5 medies/s", $"../Control/Buildings/".get_child(1), 600, load("res://Sprites/Upgrades/fosforos.png"), 3, 4.5)
	var encendedor = BuildingUpgrade.new(28, "Encendedor", "Cada parrilla te da +7 medies/s", $"../Control/Buildings/".get_child(1), 1000, load("res://Sprites/Upgrades/encendedor.png"), 7, 7)
	var fogata = BuildingUpgrade.new(29, "Fogata", "Cada parrilla te da +10 medies/s", $"../Control/Buildings/".get_child(1), 1700, load("res://Sprites/Upgrades/fogata.png"), 12, 10)
	
	
	# var steroids = PongStrengthUpgrade.new()
	# Esteroides: En el pong, empujas la pelota más rápido
	# (Ya están los sprites)
	
	
	
	
	
	var watch_ads = SurferDodgeBonus.new(17, "Mirar anuncios", 10, load("res://Sprites/Upgrades/watch_ads.png"), 25, 0.4)
	var daily_login = SurferDodgeBonus.new(18, "Login diario", 30, load("res://Sprites/Upgrades/daily_login.png"), 50, 0.6)
	var energy_system = SurferDodgeBonus.new(19, "Sistema de energía", 50, load("res://Sprites/Upgrades/energy_system.png"), 75, 1.2)
	var microtransaccions = SurferDodgeBonus.new(31, "Microtransacciones", 70, load("res://Sprites/Upgrades/microtransactions.png"), 130, 3)
	var lootbox = SurferDodgeBonus.new(32, "Lootboxes", 200, load("res://Sprites/Upgrades/lootboxes.png"), 155,7)
	var multiple_currencies = SurferDodgeBonus.new(33, "Múltiples monedas", 400, load("res://Sprites/Upgrades/multiple_currencies.png"), 180, 8)
	var rigged_matchmaking = SurferDodgeBonus.new(30, "Matchmaking trucado", 600, load("res://Sprites/Upgrades/rigged_matchmaking.png"), 220, 10)
	
	var experience_with_cubes = TetrisLinesBonus.new(20, "Dimensión alternativa", 300, load("res://Sprites/Upgrades/experience_with_cubes.png"), 1, 50)
	var washing_machine = TetrisLinesBonus.new(21, "Lavarropas", 500, load("res://Sprites/Upgrades/washing_machine.png"), 3, 150)
	
	
	var victory = Victory.new(22, "Trofeo", "Gracias por jugar! Agradecimientos especiales a Mateo Fernández por la música", ScoreType.type.OTHER, 5000, load("res://Sprites/Upgrades/medie_clicker.png"), 3500)
	
	
	
	SignalManager.on_upgrade_created.emit(better_bread)
	SignalManager.on_upgrade_created.emit(sesame_seeds)
	SignalManager.on_upgrade_created.emit(thicker_flour)
	SignalManager.on_upgrade_created.emit(automatic_stirrer)
	SignalManager.on_upgrade_created.emit(pong_unlock)
	SignalManager.on_upgrade_created.emit(tetris_unlock)
	SignalManager.on_upgrade_created.emit(surfer_unlock)
	SignalManager.on_upgrade_created.emit(golazos)
	SignalManager.on_upgrade_created.emit(sprinklers)
	SignalManager.on_upgrade_created.emit(red_card)
	SignalManager.on_upgrade_created.emit(pointer)
	SignalManager.on_upgrade_created.emit(linked_list)
	SignalManager.on_upgrade_created.emit(binary_tree)
	SignalManager.on_upgrade_created.emit(clock)
	SignalManager.on_upgrade_created.emit(stack)
	SignalManager.on_upgrade_created.emit(round_robin)
	SignalManager.on_upgrade_created.emit(raid_4)
	SignalManager.on_upgrade_created.emit(watch_ads)
	SignalManager.on_upgrade_created.emit(daily_login)
	SignalManager.on_upgrade_created.emit(energy_system)
	SignalManager.on_upgrade_created.emit(experience_with_cubes)
	SignalManager.on_upgrade_created.emit(washing_machine)
	SignalManager.on_upgrade_created.emit(pencil_sharpener)
	SignalManager.on_upgrade_created.emit(punta_de_espalda)
	SignalManager.on_upgrade_created.emit(punta_cana)
	SignalManager.on_upgrade_created.emit(fosforos)
	SignalManager.on_upgrade_created.emit(encendedor)
	SignalManager.on_upgrade_created.emit(fogata)
	SignalManager.on_upgrade_created.emit(microtransaccions)
	SignalManager.on_upgrade_created.emit(lootbox)
	SignalManager.on_upgrade_created.emit(multiple_currencies)
	SignalManager.on_upgrade_created.emit(rigged_matchmaking)
	SignalManager.on_upgrade_created.emit(victory)
	
	SignalManager.on_upgrade_created.emit(options_unlock)
	SignalManager.on_upgrade_created.emit(upgrade_count)
	
	
	
