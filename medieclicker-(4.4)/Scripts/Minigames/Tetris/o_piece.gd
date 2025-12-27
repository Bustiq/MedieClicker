extends "res://Scripts/Minigames/Tetris/Piece.gd"

func setData():
	sprite = Vector2(2, 0)
	isO = true
	pieceHeight = [Vector2(0, 0), Vector2(0, 1), Vector2(-1, 0)]
	pieceLength = [Vector2(-1, 1), Vector2(0, 1)]
func getHeight():
	return [Vector2(0, -1), Vector2(0, 0), Vector2(-1, -1)]
func getLength():
	return [Vector2(-1, 0), Vector2(0, 0)]
func getSprite():
	return Vector2(2, 0)
