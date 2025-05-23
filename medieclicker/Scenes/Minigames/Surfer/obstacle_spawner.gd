extends Node2D

var obstacles = ["res://Scenes/Minigames/Surfer/barriers.tscn"]
var last_obstacle = null


func _ready() -> void:
	SignalManager.on_surfer_death.connect(on_player_death)

func on_player_death():
	destroy_board()
	$Obstacle.stop()
	$SafeZone.stop()
	$ResetTimer.start()


func _on_reset_timer_timeout() -> void:
	$Obstacle.start()
	$Displacer.start()


func destroy_board():
	for n in get_children():
		if n is Timer:
			continue
		remove_child(n)
		n.queue_free()

#const miss_chance = 0.2




func get_random_column():
	return [-1, 0, 1].pick_random()


func _on_obstacle_timeout() -> void:
	#if randf() < miss_chance:
		#pass
	var obstacle = obstacles.pick_random()
	var node : Obstacle = load(obstacle).instantiate()
	last_obstacle = node
	add_child(node)
	node.global_position = global_position
	node.set_column(get_random_column())


const safe_zone = "res://Scenes/Minigames/Surfer/safe_zone.tscn"
func _on_safe_zone_timeout() -> void:
	var zone = load(safe_zone).instantiate()
	add_child(zone)
	zone.global_position = global_position
	zone.get_child(0).set_obstacle(last_obstacle)


func _on_displacer_timeout() -> void:
	$SafeZone.start()
