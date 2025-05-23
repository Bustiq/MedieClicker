extends Node2D

var gain = 0.1

func _ready() -> void:
	SignalManager.on_surfer_dodge.connect(on_surfer_dodge)


#Si se quiere, eventualmente cada tipo de obstáculo
#te puede dar un aumento diferente o tener diferentes mejoras

#Ahora que lo pienso sería más complicado en realidad porque
#Debería también cambiar el texto (lo que te dice cuanto ganas)
func on_surfer_dodge(obstacle : Obstacle):
	SignalManager.on_medie_gain.emit(gain + UpgradesManager.get_additive_bonus(ScoreType.type.SURFER))
