extends Node2D


var distance = 600
var start_position
var moves_up_right := true

func _ready() -> void:
	start_position = position
	flip()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func flip():
	moves_up_right = not moves_up_right
	var target
	if moves_up_right:
		target = start_position
	else:
		target =  start_position + (Vector2(-distance, distance))
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position", target, 30)
	tween.tween_callback(flip)
