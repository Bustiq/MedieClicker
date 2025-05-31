extends TextureRect

var upgrade : Upgrade
var locked := true

func _ready() -> void:
	SignalManager.on_upgrade_purchased.connect(on_upgrade_purchased)


func on_upgrade_purchased(_upgrade : Upgrade):
	if upgrade.id == _upgrade.id:
		locked = false
		$Icon.texture = upgrade.icon

func set_upgrade(_upgrade : Upgrade):
	upgrade = _upgrade




func _on_icon_mouse_entered() -> void:
	SignalManager.on_uicon_hover.emit(upgrade)




func _on_icon_mouse_exited() -> void:
	SignalManager.on_uicon_unhover.emit(upgrade)
