extends Control

var upgrade : Upgrade



func set_upgrade(new : Upgrade):
	upgrade = new
	$TextureButton.texture_normal = upgrade.icon
	if upgrade.cost - int(upgrade.cost) == 0:
		$Label.text = str(int(upgrade.cost))
	else:
		$Label.text = str(upgrade.cost)
	SignalManager.on_medies_changed.connect(change_color_if_buyable)

func get_upgrade():
	return upgrade

func change_color_if_buyable(medies : float):
	if upgrade == null:
		return
	if NumberHelper.equals(medies, upgrade.cost) or medies > upgrade.cost:
		$BlackOverlay.hide()
	else:
		$BlackOverlay.show()

func _on_texture_button_pressed() -> void:
	if MedieManager.can_afford(upgrade.cost):
		SignalManager.on_upgrade_purchased.emit(upgrade)
		SignalManager.on_purchase.emit(upgrade.cost)
		upgrade.on_purchase()





func _on_texture_button_mouse_entered() -> void:
	SignalManager.on_upgrade_hovered.emit(upgrade)




func _on_texture_button_mouse_exited() -> void:
	SignalManager.on_upgrade_unhovered.emit()
