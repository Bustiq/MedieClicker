extends Control
class_name HiddenElement
@export var upgrade : UpgradeResource

func _ready() -> void:
	UpgradeSceneMiddleman.add_element_to_show(self, upgrade.id)
