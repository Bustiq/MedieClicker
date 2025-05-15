extends TextureButton


func _on_pressed() -> void:
	SignalManager.on_medie_clicked.emit()
