extends Button
@onready var producer: Control = $".."


func _ready() -> void:
	producer.on_price_changed.connect(update_price)
	update_price(producer.start_price)

func update_price(price):
	text = str(price)
