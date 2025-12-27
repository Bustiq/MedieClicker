extends Label

func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(show_increase)
	text = "Individual: " + str($"..".increase) + " medies/s"


func show_increase(upgrade : Upgrade):
	if upgrade.type != $"..".score_type:
		return
	
	var value = ($"..".increase + UpgradesManager.get_additive_bonus($"..".score_type)) * UpgradesManager.get_times_bonus($"..".score_type)
	text = "Individual: " + str(value) + " medies/s"
