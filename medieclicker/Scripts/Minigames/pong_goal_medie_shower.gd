extends Label

var pong_increase : float


func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(update_text)

func _on_pong_viewport_child_entered_tree(node: Node) -> void:
	pong_increase = $"../PongViewportContainer/PongViewport".get_child(0).base_pong_score
	text = "Medies/gol: " + str(pong_increase)
	show()

func update_text(upgrade : Upgrade):
	if upgrade.type != ScoreType.type.PONG:
		return
	text = "Medies/gol: " + str(pong_increase + UpgradesManager.get_additive_bonus( ScoreType.type.PONG))
