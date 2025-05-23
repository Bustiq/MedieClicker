extends SubViewportContainer
var paddle


func _ready():
	get_child(0).child_entered_tree.connect(get_paddle)



func get_paddle(minigame : Node):
	print("Pong comprado (viewport container)")
	paddle = minigame.find_child("Player")
	

func _input(event):
	if not paddle:
		return
	paddle._input(event)
