extends GridContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_upgrade_unlocked.connect(add_upgrade_to_shop)
	SignalManager.on_upgrade_purchased.connect(remove_upgrade_from_shop)

const upgrade_scene = "res://Scenes/upgrade.tscn"

func add_upgrade_to_shop(upgrade : Upgrade):
	var instance = load(upgrade_scene).instantiate()
	instance.set_upgrade(upgrade)
	instance.change_color_if_buyable(MedieManager.get_medies())
	add_child(instance)

func remove_upgrade_from_shop(upgrade : Upgrade):
	for child in get_children():
		if child.get_upgrade() == upgrade:
			remove_child(child)
			child.queue_free()
			return
