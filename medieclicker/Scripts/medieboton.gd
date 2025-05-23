extends TextureButton


func _ready() -> void:
	SignalManager.on_game_win.connect(make_yellow)

func _on_pressed() -> void:
	SignalManager.on_medie_clicked.emit()

func make_yellow():
	self_modulate = Color(1, 1, 0)
