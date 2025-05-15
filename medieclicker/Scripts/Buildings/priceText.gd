extends Button
@onready var building: Control = $".."


func _ready() -> void:
	building.on_bought.connect(update_price)
	update_price(building.start_price)

func update_price(price):
	text = str(price)
