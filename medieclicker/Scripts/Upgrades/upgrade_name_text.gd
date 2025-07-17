extends Label

func _ready() -> void:
	SignalManager.on_upgrade_hovered.connect(update_text)
	SignalManager.on_upgrade_unhovered.connect(reset_text)
	reset_text()

func reset_text():
	text = ""

func update_text(upgrade : Upgrade):
	text = tr(upgrade.upgrade_name)
