extends SubViewportContainer
var player


func _ready():
	get_child(0).child_entered_tree.connect(get_paddle)
	   


func get_paddle(minigame : Node):
	print("Pong comprado (viewport container)")
	player = minigame.find_child("Player")
	show()

func _input(event):
	if not player:
		return
	if not event is InputEventMouse:
		return
	player._input(event)
