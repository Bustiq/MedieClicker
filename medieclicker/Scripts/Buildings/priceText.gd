extends Label
@onready var building: Node2D = $".."


func _ready() -> void:
	building.on_bought.connect(update_price)
	update_price(building.start_price)

func update_price(price):
	print("tarifa")
	text = str(price)
