extends AudioStreamPlayer


@export var _playlist:AudioStreamPlaylist


func _ready():
	stream = _playlist
	play()
