extends Node2D
class_name Faller

var speed = 64
var paused = false
func _ready() -> void:
	SignalManager.on_surfer_game_pause.connect(on_surfer_game_pause)

func _process(delta: float) -> void:
	if paused:
		return
	position.y += speed * delta

func on_surfer_game_pause(_paused : bool):
	paused = _paused
