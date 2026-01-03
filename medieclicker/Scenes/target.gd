extends TextureButton


func _on_button_up() -> void:
	SignalManager.on_target_clicked.emit()
	get_parent().remove_child(self)
	
	queue_free()


func _on_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(scale.x * 1.2, scale.x * 1.2), 0.075)
	tween.set_ease(Tween.EaseType.EASE_OUT)
	tween.set_trans(Tween.TRANS_BOUNCE)
