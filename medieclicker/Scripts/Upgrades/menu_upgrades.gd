extends Button







func _on_pressed() -> void:
	print("press")
	$UpgradesBackground.show()


func _on_back_pressed() -> void:
	$UpgradesBackground.hide()
