extends Area2D
class_name SafeZone

var dodged_obstacle : Obstacle

func set_obstacle(obstacle : Obstacle):
	dodged_obstacle = obstacle

func get_dodged_obstacle():
	return dodged_obstacle
