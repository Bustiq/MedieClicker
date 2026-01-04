extends Label

func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(show_increase)
	text = "Individual: " + str($"..".increase) + " medies/s"


func show_increase(upgrade : UpgradeResource):
	if upgrade is ScoreBonus and upgrade.type == get_parent().score_type:
		var value = UpgradesManager.get_total_bonus($"..".increase, $"..".score_type)
		text = "Individual: " + str(value) + " medies/s"
