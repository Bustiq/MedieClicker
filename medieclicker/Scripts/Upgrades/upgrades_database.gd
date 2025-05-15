extends Node



func _ready() -> void:
	UpgradesManager.create_building_upgrade(BuildingUpgrade.new("Mejor pan", "Cada rollo de cocina da +0.1 m/s", $"../Control/Buildings/".get_child(0), 1, load("res://Sprites/Upgrades/1_Better_bread.png"), 1, 0.005, 1))
	UpgradesManager.create_building_upgrade(BuildingUpgrade.new("Semillas de sésamo", "Cada rollo de cocina da +0.5 m/s", $"../Control/Buildings/".get_child(0), 100, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 10, 0.02, 1))
	UpgradesManager
