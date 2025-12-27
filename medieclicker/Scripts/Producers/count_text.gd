extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"..".on_producer_count_changed.connect(show_count)
	show_count(0)


func show_count(count):
	text = "Cantidad: " + str(count)
