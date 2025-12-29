extends Label

func _ready() -> void:
	$"..".on_producer_count_changed.connect(update_on_purchase)
	SignalManager.on_upgrade_purchased.connect(update_on_upgrade)
	text = "Total: 0 medies/s"

func update_on_purchase(_count):
	text = "Total: " + str($"..".get_producer_increase()) + " medies/s"


func update_on_upgrade(upgrade : UpgradeResource):
	if upgrade is ScoreBonus and upgrade.type == get_parent().score_type:
		text = "Total: " + str($"..".get_producer_increase()) + " medies/s"
