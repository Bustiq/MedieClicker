extends "res://Scripts/Minigames/Tetris/Piece.gd"


	
func setData():
	sprite = Vector2(6, 0)
	pieceHeight = [Vector2(-1, -1), Vector2(-1, 0)]
	pieceLength = [Vector2(0, 0), Vector2(-1, 0), Vector2(1, 0)]
	
func getHeight():
	return [Vector2(-1, -1), Vector2(-1, 0)]
func getLength():
	return [Vector2(0, 0), Vector2(-1, 0), Vector2(1, 0)]
func getSprite():
	return Vector2(6, 0)
	
func rotTo90():
	pieceHeight = [Vector2(0, -1), Vector2(0, 0), Vector2(0, 1)]
	pieceLength = [Vector2(0, -1), Vector2(1, -1)]
	if checkForAvailableRotations():
		erase_cell(Vector2(-1,0))
		erase_cell(Vector2(1,0))
		erase_cell(Vector2(-1,-1))
		set_cell(Vector2(0, -1), 0, sprite)
		set_cell(Vector2(0, 1), 0, sprite) 
		set_cell(Vector2(1, -1), 0, sprite)
	else:
		rot = 0
		rotTo0()
func rotTo180():
	pieceLength = [Vector2(0, 0), Vector2(-1, 0), Vector2(1, 0)]
	pieceHeight = [Vector2(1, 0), Vector2(1, 1)]
	if checkForAvailableRotations():
		erase_cell(Vector2(0, 1))
		erase_cell(Vector2(0, -1))
		erase_cell(Vector2(1, -1))
		set_cell(Vector2(-1, 0), 0, sprite)
		set_cell(Vector2(1, 0), 0, sprite) 
		set_cell(Vector2(1, 1), 0, sprite)
	else:
		rot = 90
		rotTo90()
func rotTo270():
	pieceLength = [Vector2(0, 1), Vector2(-1, 1)]
	pieceHeight = [Vector2(0, -1), Vector2(0, 0), Vector2(0, 1)]
	if checkForAvailableRotations():
		erase_cell(Vector2(-1, 0))
		erase_cell(Vector2(1, 0))
		erase_cell(Vector2(1, 1))
		set_cell(Vector2(0, 1), 0, sprite)
		set_cell(Vector2(0, -1), 0, sprite) 
		set_cell(Vector2(-1, 1), 0, sprite)
	else:
		rot = 180
		rotTo180()
func rotTo0():
	pieceHeight = [Vector2(-1, -1), Vector2(-1, 0)]
	pieceLength = [Vector2(0, 0), Vector2(-1, 0), Vector2(1, 0)]
	if checkForAvailableRotations():
		erase_cell(Vector2(0,1))
		erase_cell(Vector2(0, -1))
		erase_cell(Vector2(-1, 1))
		set_cell(Vector2(-1, 0), 0, sprite)
		set_cell(Vector2(1, 0), 0, sprite) 
		set_cell(Vector2(-1, -1), 0, sprite)
	else:
		rot = 270
		rotTo270()
