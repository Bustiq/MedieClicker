extends SubViewportContainer
func _ready():
	get_child(0).child_entered_tree.connect(show_self)
	UpgradeSceneMiddleman.add_minigame_container(UpgradeSceneMiddleman.MINIGAME_3, get_child(0))


func show_self(minigame : Node):
	show()
