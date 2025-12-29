extends Label

func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(update_mps)
	text = "Medies/click: " + str($"../..".get_clicked_medies_with_bonus())

func update_mps(upgrade : UpgradeResource):
	if upgrade is ScoreBonus and upgrade.type == ScoreType.type.CLICK:
		text = "Medies/click: " + str($"../..".get_clicked_medies_with_bonus())
