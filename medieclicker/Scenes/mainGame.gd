extends Node2D
var medieCount : float = 0
var mps : float = 0
var mpc : float = 0.01
var buildings := []
var upgrades := []




func _ready() -> void:
	SignalManager.on_medie_clicked.connect(on_click)


func on_click():
	medieCount += mpc
	$Label.text = str(medieCount)


func _process(delta: float) -> void:
	pass
