extends Node2D
@export var iPiece = load("res://Scenes/Minigames/Tetris/i_piece.tscn")
@export var jPiece = load("res://Scenes/Minigames/Tetris/j_piece.tscn")
@export var lPiece = load("res://Scenes/Minigames/Tetris/l_piece.tscn")
@export var oPiece = load("res://Scenes/Minigames/Tetris/o_piece.tscn")
@export var sPiece = load("res://Scenes/Minigames/Tetris/s_piece.tscn")
@export var tPiece = load("res://Scenes/Minigames/Tetris/t_piece.tscn")
@export var zPiece = load("res://Scenes/Minigames/Tetris/z_piece.tscn")
@onready var lineSound = $clearLine as AudioStreamPlayer2D
var currentPiece
var score = 0
var total40LTime : int = 1
var heldPiece
var bag = [iPiece, jPiece, lPiece, oPiece, sPiece, tPiece, zPiece]
var enteredPieces = 0
var clearedLines = 0
var combo = 1
var actualEnteredPieces = 0
var pieceStream = []
var canHold = true
var holdStatus = 0
var posToErase = []
var drawingPositions = [Vector2(29, 4), Vector2(29, 7), Vector2(29, 10), Vector2(29, 13), Vector2(29, 16)]
var heldPiecePos = Vector2(11, 4)
var heldPiecesToDelete = []

var gain_per_line = 100


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("Escape"):
		get_tree().change_scene_to_file("res://Scenes/canvas_layer.tscn")
		
	$LabelManager/timeLeft.text = str(int($TimerManager/BlitzTimer.time_left))
	$LabelManager/PPSText.text = str(float(actualEnteredPieces/total40LTime))
func _ready() -> void:
	
	scrambleBag(2)
	enterPiece()
	$"TimerManager/40LTimer".start()
	$LabelManager/Combo.show()
	$LabelManager/ComboText.show()
	$LabelManager/ClearedLines.show()
	$LabelManager/ClearedLinesText.show()
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Hold"):
		holdPiece()


func registerClearedLine(LinesCleared : int):
	SignalManager.on_tetris_line_cleared.emit(LinesCleared)
	SignalManager.on_medie_gain.emit((gain_per_line + UpgradesManager.get_additive_bonus(ScoreType.type.TETRIS)) * LinesCleared)
	if  LinesCleared >= 1:
		$TimerManager/ComboTimer.stop()
		$TimerManager/ComboTimer.start()
		combo += 1/LinesCleared
		$LabelManager/ComboText.text = str(combo)
		score += (10 * LinesCleared) * LinesCleared * combo
		$LabelManager/Score.text = str(score)
	clearedLines += LinesCleared
	match combo:
		2: lineSound.play()
		3:
			lineSound.pitch_scale = 1.3
			lineSound.play()
		4:
			lineSound.pitch_scale = 1.6
			lineSound.play()
	if combo >= 5:
		lineSound.play()
		lineSound.pitch_scale = 1.9
		
			

		enterPiece()
		
		get_tree().change_scene_to_file("res://Scenes/game_over_scene.tscn")
		$LabelManager/ClearedLinesText.text = str(clearedLines)
	
		
func holdPiece():
	if canHold:
		if holdStatus == 0:
			heldPiece = currentPiece.duplicate() 
			$TileMap.get_child(3).queue_free()
			$TileMap/ShadowBoard.clear()
			enterPiece()
			holdStatus += 1
		else:
			print(heldPiece)
			$TileMap.get_child(3).queue_free()
			$TileMap/ShadowBoard.clear()
			$TileMap.add_child(heldPiece.instantiate())
			heldPiece = currentPiece
			holdStatus += 1
		canHold = false
	clearOutdatedHeldPieces()
	drawHeldPiece()
func scrambleBag(amm : int):
	for i in range(amm):
		bag.shuffle()
		pieceStream.append_array(bag)
		
func enterPiece():
	if canHold or actualEnteredPieces == 0:
		actualEnteredPieces += 1
	clearOutDatedPieces()
	$TileMap.add_child(pieceStream[0].instantiate())
	drawIncomingPieces()
	currentPiece = pieceStream[0]
	pieceStream.pop_front()
	enteredPieces += 1
	canHold = true
	if enteredPieces == 5:
		scrambleBag(1)
		enteredPieces = 0
	pass	

func drawHeldPiece():
	for tile in heldPiece.instantiate().getHeight():
		$TileMap/Board.set_cell(heldPiecePos + tile, 0, heldPiece.instantiate().getSprite())
		heldPiecesToDelete.push_front(heldPiecePos + tile)
	for tile in heldPiece.instantiate().getLength():
		$TileMap/Board.set_cell(heldPiecePos + tile, 0, heldPiece.instantiate().getSprite())
		heldPiecesToDelete.push_front(heldPiecePos + tile)

func drawIncomingPieces():
	var pieceToDraw = 1
	for pos in drawingPositions:
		
		for tile in pieceStream[pieceToDraw].instantiate().getHeight():
			$TileMap/Board.set_cell(pos + tile, 0, pieceStream[pieceToDraw].instantiate().getSprite())
			posToErase.push_front(pos + tile)
			pass
		for tile in pieceStream[pieceToDraw].instantiate().getLength():
			$TileMap/Board.set_cell(pos + tile, 0, pieceStream[pieceToDraw].instantiate().getSprite())
			posToErase.push_front(pos + tile)
			pass
		pieceToDraw += 1
		
func clearOutDatedPieces():
	for tile in posToErase:
		$TileMap/Board.erase_cell(tile)
		
func clearOutdatedHeldPieces():
	for tile in heldPiecesToDelete:
		$TileMap/Board.erase_cell(tile)

func _on_l_timer_timeout() -> void: 
	total40LTime += 1
	var m = int(total40LTime/60.0)
	var s = total40LTime - m * 60
	$"LabelManager/40LTime".text = '%02d:%02d' % [m, s]

func _on_blitz_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_over_scene.tscn")
	enterPiece()


func _on_combo_timer_timeout() -> void:
	combo = 1
	$LabelManager/ComboText.text = str(combo)

func lose():
	
	if is_inside_tree():
		get_tree().change_scene_to_file("res://Scenes/game_over_scene.tscn")
