class_name Save

var total_medies : float
var current_medies : float
var purchased_upgrades := []
var purchased_buildings := []

func _init(_total_medies, _current_medies, _purchased_upgrades, _purchased_buildings) -> void:
	self.total_medies = _total_medies
	self.current_medies = _current_medies
	self.purchased_upgrades = _purchased_upgrades
	self.purchased_buildings = _purchased_buildings
