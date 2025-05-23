extends Faller
class_name Obstacle

var center = 379.0
var displacement = 48

func set_column(column : int):
	position.x = get_column_position(column)

func get_column_position(column : int):
	return center + column * displacement
