extends SubViewportContainer
func _ready():
	get_child(0).child_entered_tree.connect(show_self)
	   


func show_self(minigame : Node):
	show()
