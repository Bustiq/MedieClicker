extends Control

@export var upgrade_id : int

func _ready() -> void:
	UpgradeSceneMiddleman.add_element_to_show(self, upgrade_id)
