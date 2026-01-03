extends Node

@onready var parent : TextureButton = $".."

const RESIZE_TIME := 0.075
#@export var IDLE_SCALE = 0.1
#@export var CLICKED_SCALE = 0.12

var IDLE_SCALE : float
var CLICKED_SCALE : float

func _ready() -> void:
	IDLE_SCALE = parent.scale.x
	CLICKED_SCALE = IDLE_SCALE * 1.2
	parent.button_down.connect(_on_button_down)
	parent.button_up.connect(_on_button_up)

func _on_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(parent, "scale", Vector2(CLICKED_SCALE, CLICKED_SCALE), RESIZE_TIME)
	tween.set_ease(Tween.EaseType.EASE_OUT)
	tween.set_trans(Tween.TRANS_BOUNCE)




func _on_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(parent, "scale", Vector2(IDLE_SCALE, IDLE_SCALE), RESIZE_TIME)
	tween.set_ease(Tween.EaseType.EASE_OUT)
	tween.set_trans(Tween.TRANS_BOUNCE)
