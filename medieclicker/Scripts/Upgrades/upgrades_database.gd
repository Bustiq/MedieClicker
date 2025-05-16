extends Node

var upgrades = []

func _ready() -> void:
	var better_bread = BuildingUpgrade.new(1, "Mejor pan", "Cada rollo de cocina da +0.1 m/s", $"../Control/Buildings/".get_child(0), 1, load("res://Sprites/Upgrades/1_Better_bread.png"), 1, 0.005, 1)
	var sesame_seeds = BuildingUpgrade.new(2, "Semillas de sésamo", "Cada rollo de cocina da +0.5 m/s", $"../Control/Buildings/".get_child(0), 100, load("res://Sprites/Upgrades/2_Sesame_seeds.png"), 10, 0.02, 1)
	upgrades = [better_bread, sesame_seeds]
	
	UpgradesManager.create_building_upgrade(better_bread)
	UpgradesManager.create_building_upgrade(sesame_seeds)
