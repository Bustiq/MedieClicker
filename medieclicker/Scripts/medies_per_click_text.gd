extends Label

func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(update_mps)
	text = "Medies/click: " + str($"../..".get_clicked_medies_with_bonus())

func update_mps(upgrade : Upgrade):
	if upgrade.type != ScoreType.type.CLICK:
		return
	text = "Medies/click: " + str($"../..".get_clicked_medies_with_bonus())
