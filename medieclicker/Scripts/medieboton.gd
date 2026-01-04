extends TextureButton


func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(on_upgrade_purchased)
	SignalManager.on_game_win.connect(make_yellow)

func _on_pressed() -> void:
	SignalManager.on_medie_clicked.emit()

func make_yellow():
	self_modulate = Color(1, 1, 0)


const TARGET_MIN_X = 300
const TARGET_MAX_X = 1450
const TARGET_MIN_Y = 250
const TARGET_MAX_Y = 1250

const TARGET = preload("uid://k0mwwmilyk03")

func get_active_target_count() -> int:
	return get_child_count() - 1

func on_upgrade_purchased(upgrade : UpgradeResource):
	if upgrade is ScoreBonus and upgrade.type == ScoreType.type.TARGET_COUNT:
		while get_active_target_count() < UpgradesManager.get_total_bonus(0, ScoreType.type.TARGET_COUNT):
			spawn_target()

func spawn_target():
	var instance : TextureButton = TARGET.instantiate()
	instance.position.x = randf_range(TARGET_MIN_X, TARGET_MAX_X)
	instance.position.y = randf_range(TARGET_MIN_Y, TARGET_MAX_Y)
	add_child(instance)
