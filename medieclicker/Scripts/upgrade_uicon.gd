extends TextureRect

var upgrade : UpgradeResource
var locked := true

func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(on_upgrade_purchased)


func on_upgrade_purchased(_upgrade : UpgradeResource):
	if upgrade.id == _upgrade.id:
		locked = false
		$Icon.texture = load("res://Sprites/Upgrades/" + upgrade.icon_name + ".png")

func set_upgrade(_upgrade : UpgradeResource):
	upgrade = _upgrade




func _on_icon_mouse_entered() -> void:
	SignalManager.on_uicon_hover.emit(upgrade)




func _on_icon_mouse_exited() -> void:
	SignalManager.on_uicon_unhover.emit(upgrade)
