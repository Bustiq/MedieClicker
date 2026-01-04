extends Node


const DODGE : int = 16
const DODGE_SCENE = "res://Scenes/Minigames/Surfer/surfer_game.tscn"
const PONG : int = 3
const PONG_SCENE = "res://Scenes/Minigames/Pong/pong_game.tscn"
const MINIGAME_3 : int = 4
const MINIGAME_3_SCENE = "res://Scenes/Minigames/Tetris/tetris_game.tscn"

var hidden_elements : Dictionary = {} #int, Array[Control]
var minigame_containers : Dictionary[int, SubViewport] = {}


func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(on_upgrade_purchased)

func add_element_to_show(node : Control, upgrade_id : int):
	if not hidden_elements.has(upgrade_id):
		hidden_elements.set(upgrade_id, [node])
	else:
		hidden_elements.get(upgrade_id).append(node)
		

func add_minigame_container(upgrade_id : int, node : SubViewport):
	minigame_containers.set(upgrade_id, node)


func on_upgrade_purchased(upgrade : UpgradeResource):
	if hidden_elements.has(upgrade.id):
		for element in hidden_elements.get(upgrade.id):
			element.show()

	match upgrade.id:
		DODGE:
			var scene = load(DODGE_SCENE).instantiate()
			minigame_containers.get(DODGE).add_child(scene)

		PONG:
			var scene = load(PONG_SCENE).instantiate()
			minigame_containers.get(PONG).add_child(scene)

		MINIGAME_3:
			var scene = load(MINIGAME_3_SCENE).instantiate()
			minigame_containers.get(MINIGAME_3).add_child(scene)
