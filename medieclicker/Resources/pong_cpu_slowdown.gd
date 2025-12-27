extends UpgradeResource
class_name PongCpuSlowdown

@export var speed_multiplier : float


func get_speed_multiplier():
	return speed_multiplier
	
func get_description():
	return "El enemigo del pong se mueve un " + str((1 - speed_multiplier) * 100) + "% más lento"
