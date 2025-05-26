extends Label

var total_upgrade_count := 0
var current_upgrade_count := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_upgrade_created.connect(on_upgrade_created)
	current_upgrade_count = 0

	text = "Mejoras: " + str(current_upgrade_count) + "/" + str(total_upgrade_count)
	SignalManager.on_upgrade_purchased.connect(update_upgrade_count)

func update_upgrade_count(upgrade : Upgrade):
	current_upgrade_count += 1
	text = "Mejoras: " + str(current_upgrade_count) + "/" + str(total_upgrade_count)

func on_upgrade_created(upgrade : Upgrade):
	total_upgrade_count += 1
	text = "Mejoras: " + str(current_upgrade_count) + "/" + str(total_upgrade_count)
