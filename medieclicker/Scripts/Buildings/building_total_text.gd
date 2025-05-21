extends Label

func _ready() -> void:
	$"..".on_building_count_changed.connect(update_on_purchase)
	SignalManager.on_upgrade_purchased.connect(update_on_upgrade)
	text = "Total: 0 medies/s"

func update_on_purchase(count):
	text = "Total: " + str($"..".get_building_increase()) + " medies/s"


func update_on_upgrade(upgrade : Upgrade):
	if upgrade.type != $"..".score_type:
		return
	text = "Total: " + str($"..".get_building_increase()) + " medies/s"
