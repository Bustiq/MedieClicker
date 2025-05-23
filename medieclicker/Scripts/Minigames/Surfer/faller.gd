extends Node2D
class_name Faller

var speed = 64
func _process(delta: float) -> void:
	position.y += speed * delta
