extends Obstacle

@export var barrier: Sprite2D
@export var barrier_2: Sprite2D


func set_column(column : int):
	
	match column:
		-1:
			barrier.global_position.x = get_column_position(0)
			barrier_2.global_position.x = get_column_position(1)
		0:
			barrier.global_position.x = get_column_position(-1)
			barrier_2.global_position.x = get_column_position(1)
		1:
			barrier.global_position.x = get_column_position(-1)
			barrier_2.global_position.x = get_column_position(0)
	pass
