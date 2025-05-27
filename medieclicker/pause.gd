extends Control



# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db($"../PauseBackground/MasterSlider".value))
	AudioServer.set_bus_volume_db(1, linear_to_db($"../PauseBackground/MusicSlider".value))
	AudioServer.set_bus_volume_db(3, linear_to_db($"../PauseBackground/SFXSlider".value))



func _on_unpause_pressed() -> void:
	get_tree().paused = false
	$"../PauseBackground".hide()


func _on_pressed() -> void:
	get_tree().paused = true
	$"../PauseBackground".show()




func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value))



func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(value))



func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
