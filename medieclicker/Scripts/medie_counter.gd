extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_medies_changed.connect(update_medie_count)

func update_medie_count(count : float):
	text = str(count)
