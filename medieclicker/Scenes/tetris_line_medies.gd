extends Label

var line_medies

func _on_tetris_viewport_child_entered_tree(node: Node) -> void:
	line_medies = node.gain_per_line
	print(line_medies)
	text = "Medies/linea: " + str(line_medies)
	show()

func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(update_text)



func update_text(upgrade : Upgrade): 
	if upgrade.type != ScoreType.type.TETRIS or not line_medies:
		return
	text = "Medies/linea: " + str(line_medies + UpgradesManager.get_additive_bonus( ScoreType.type.TETRIS))
