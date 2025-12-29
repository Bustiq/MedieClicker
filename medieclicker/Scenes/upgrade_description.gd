extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_upgrade_hovered.connect(set_description)
	SignalManager.on_upgrade_unhovered.connect(reset_description)
	reset_description()


func set_description(upgrade : UpgradeResource):
	text = upgrade.get_description()

func reset_description():
	text = ""
