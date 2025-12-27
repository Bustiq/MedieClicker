extends Label

var dodge_medies : float


func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(update_text)



func update_text(upgrade : Upgrade):
	if upgrade.type != ScoreType.type.SURFER or not dodge_medies  :
		return
	text = "Medies/esquive: " + str(dodge_medies + UpgradesManager.get_additive_bonus( ScoreType.type.SURFER))


func _on_surfer_viewport_child_entered_tree(node: Node) -> void:
	dodge_medies = node.gain
	text = "Medies/esquive: " + str(dodge_medies)
	show()
