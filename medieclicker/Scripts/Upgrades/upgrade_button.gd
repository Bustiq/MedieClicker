extends Control

var upgrade : Upgrade


func set_upgrade(new : Upgrade):
	upgrade = new
	$TextureButton.texture_normal = upgrade.icon
	$Label.text = str(upgrade.cost)
	SignalManager.on_medies_changed.connect(change_color_if_buyable)

func change_color_if_buyable(medies : float):
	if upgrade == null:
		return
	if NumberHelper.equals(medies, upgrade.cost) or medies > upgrade.cost:
		$BlackOverlay.hide()
	else:
		$BlackOverlay.show()

func _on_texture_button_pressed() -> void:
	print("buy???")
