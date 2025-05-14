extends TileMapLayer

var oldShadow
var oldPieceHeight
var oldPieceLength
var input_dir
@onready var table = $"../Board" as TileMapLayer
@onready var shadowBoard = $"../ShadowBoard" as TileMapLayer
var canSoftDrop = true
var softDropTimer = Timer.new()
var gravityTimer = Timer.new() as Timer
var rot = 0
var canMoveSideWays = true
var handling = Timer.new()
var counter = 0
var leftRadius : int
var canTryAgain = true	
var rightRadius : int
var isO = false	
var globalPiecePosition = Vector2(19, 1)
@export var pieceHeight = []
@export var pieceLength = []

var sprite
var isDoubleChecking = false
var placementCounter = 0
func _ready() -> void:
	setData()

	position += globalPiecePosition*32

	handling.wait_time = 0.2
	softDropTimer.wait_time = 0.2

	handling.wait_time = 0.2
	softDropTimer.wait_time = 0.2

	add_child(handling)
	add_child(softDropTimer)
	softDropTimer.timeout.connect(resetCooldown)
	gravityTimer.wait_time = 0.5
	gravityTimer.autostart = true
	add_child(gravityTimer)
	handling.timeout.connect(resetHandlingCD)
	gravityTimer.timeout.connect(gravityTimerTimeout)
	var modifier = hardDrop(false)
	proyectShadow(modifier, false)
	
func setData():
	pass
	
func getHeight():
	pass
func getLength():
	pass
func getSprite():
	pass
	
func _process(delta: float) -> void:

	input_dir = Vector2.ZERO
	if Input.is_action_just_pressed("HardDrop"):
		hardDrop(true)
	if Input.is_action_just_pressed("Rotate_cw"):
		rot += 90
		rotatePiece()
		var modifier = hardDrop(false)
		proyectShadow(modifier, true)
		
	if Input.is_action_pressed("Move_Left") and !Input.is_action_pressed("Soft_Drop") and checkForBoundaries(-1, 0):
		if canMoveSideWays:
			canMoveSideWays = false
			handling.start()
			moveLeft(1)
			var modifier = hardDrop(false)
			proyectShadow(modifier, true)
	if Input.is_action_pressed("Move_Right") and !Input.is_action_pressed("Soft_Drop") and checkForBoundaries(1, 0):
		if canMoveSideWays:
			canMoveSideWays = false
			handling.start()		
			moveRight(1)
			var modifier = hardDrop(false)
			proyectShadow(modifier, true)
	if canSoftDrop:
		if Input.is_action_pressed("Soft_Drop"):
			
			softDropTimer.start()
			canSoftDrop = false
			moveDown(1)
	position += input_dir
		
func checkForBoundaries(dirx : int, diry : int):
	if diry == 0:
		for x in pieceHeight:
			var distanceToCheck = 1
			while get_cell_tile_data(Vector2(x.x + dirx * distanceToCheck, x.y)) == get_cell_tile_data(x):
				distanceToCheck += 1
				
				
			if table.get_cell_tile_data((globalPiecePosition + x) + Vector2(distanceToCheck * dirx, 0)):
				return false
		return true
	else:
		
		for y in pieceLength:
			
			var distanceToCheck = 1
			while get_cell_tile_data(Vector2(y.x, y.y + diry * distanceToCheck)) == get_cell_tile_data(y):
				distanceToCheck += 1
			if table.get_cell_tile_data((globalPiecePosition + y) + Vector2(0, distanceToCheck * diry)):
				
				return false
			
		return true

func resetHandlingCD():
	canMoveSideWays = true	

func hardDrop(isHardropping):
	var disToCheck = 0
	
		
	var needsToAddDistance = false
	var minDisToCheck = 40
	for tile in pieceLength:
		var additionalDistanceToCheck = 1
		while get_cell_tile_data(tile + Vector2(0, additionalDistanceToCheck)) == get_cell_tile_data(tile):
			needsToAddDistance = true
			additionalDistanceToCheck += 1
		while !table.get_cell_tile_data(Vector2(globalPiecePosition + tile) + Vector2(0, disToCheck)):
			disToCheck += 1
			
		if needsToAddDistance:
			disToCheck -= (additionalDistanceToCheck - 1)
		
		if disToCheck < minDisToCheck:
			minDisToCheck = disToCheck
		disToCheck = 0
		additionalDistanceToCheck = 1
		needsToAddDistance = false
	if isHardropping:
		addPieceToCluster(minDisToCheck - 1)
	else: return minDisToCheck - 1

func proyectShadow(modifier, deletePrevious):
	if deletePrevious:
		deleteShadow(oldShadow, oldPieceHeight, oldPieceLength)
	for tile in pieceHeight:
		shadowBoard.set_cell((globalPiecePosition + Vector2(0, modifier)) + tile, 0, sprite)
	for tile in pieceLength:
		shadowBoard.set_cell((globalPiecePosition + Vector2(0, modifier)) + tile, 0, sprite)
	oldShadow = globalPiecePosition + Vector2(0, modifier)
	oldPieceHeight = pieceHeight
	oldPieceLength = pieceLength

func deleteShadow(modifier, oldPieceHeight, oldPieceLength):
	for tile in oldPieceHeight:
		shadowBoard.erase_cell(modifier + tile)
	for tile in oldPieceLength:
		shadowBoard.erase_cell(modifier + tile)

func addPieceToCluster(modifier : int):

	table.setCell(pieceLength, sprite, false, globalPiecePosition + Vector2(0, modifier))
	table.setCell(pieceHeight, sprite, true, globalPiecePosition + Vector2(0, modifier))
	placementCounter = 0
	$"../../dropPiece".play()
	queue_free()
	shadowBoard.clear()
	
	
	
func  resetCooldown():
	canSoftDrop = true
func gravityTimerTimeout():
	moveDown(1)
	position += input_dir


func moveRight(quant : int):
	input_dir = Vector2(32, 0) * quant
	globalPiecePosition.x += 1 * quant
	
func moveLeft(quant : int):
	input_dir = Vector2(-32, 0) * quant
	globalPiecePosition.x -= 1 * quant

func moveUp(quant : int):
	
	input_dir = Vector2(0, -32) * quant
	globalPiecePosition.y -= 1 * quant
	
func moveDown(quant : int):
	
	if checkForBoundaries(0, 1):
		input_dir = Vector2(0, 32) * quant
		globalPiecePosition.y += 1 * quant
	else:
		placementCounter += 0.2
	if placementCounter >= 2:
		addPieceToCluster(0)

func tryRight():
	var addedCount = 0
	var neededMovement = 0
	var collisionCounter = false
	var simulatedPosition = pieceLength.duplicate()
	var simulatedHeight = pieceHeight.duplicate()
	#Chequea si puede mover la pieza a la derecha

	while neededMovement <= 2:
		addedCount += 1
		collisionCounter = false	
		for tile in simulatedPosition:
			if table.get_cell_tile_data(globalPiecePosition + tile):
				collisionCounter = true
				neededMovement += 1
				break	
		if !isDoubleChecking:
			for tile in simulatedHeight:
				if table.get_cell_tile_data(globalPiecePosition + tile):
					return tryUp2()	
		if !collisionCounter:
			moveRight(neededMovement)
		
			for i in range(simulatedPosition.size()):
				simulatedPosition[i] -= Vector2(addedCount/2, 0)
			return true
		for i in range(simulatedPosition.size()):	
			simulatedPosition[i] += Vector2(1, 0)
	
	return tryLeft()
	
func tryLeft():
	#chequea si la puede mover a la izquierda	
	var addedCount = 0
	var neededMovement = 0
	var collisionCounter = false
	var simulatedPosition = pieceLength.duplicate()
	
	neededMovement = 0
	collisionCounter = false	
	
	while neededMovement <= 2:
		addedCount += 1
		collisionCounter = false	
		for tile in simulatedPosition:
			
			if table.get_cell_tile_data(globalPiecePosition + tile):
				
				collisionCounter = true
				neededMovement += 1
				break	
			
		if !collisionCounter:
			
			moveLeft(neededMovement)
			
			return true
		for i in range(simulatedPosition.size()):
			simulatedPosition[i] -= Vector2(1, 0)	
	
	return tryUp()		
			
func tryUp():
	
	var addCount = 0
	var neededMovement = 0
	var collisionCounter = false
	var simulatedPosition = pieceLength.duplicate()
	
	neededMovement = 0
	collisionCounter = false	
	
	while neededMovement <= 2:
		addCount += 1
		collisionCounter = false	
		for tile in simulatedPosition:
			if table.get_cell_tile_data(globalPiecePosition + tile):
				
				collisionCounter = true
				neededMovement += 1
				break	
			
		if !collisionCounter:
			moveUp(neededMovement)
			
			
			return true	
			
		for i in range(simulatedPosition.size()):
			simulatedPosition[i] -= Vector2(0, 1)	
	
	return false		
	
	
func tryUp2():
	var addCount = 0
	var neededMovement = 0
	var collisionCounter = false
	var simulatedPosition = pieceHeight.duplicate()
	
	neededMovement = 0
	collisionCounter = false	
	
	while neededMovement <= 2:
		addCount += 1
		collisionCounter = false	
		for tile in simulatedPosition:
			if table.get_cell_tile_data(globalPiecePosition + tile):
				
				collisionCounter = true
				neededMovement += 1
				break	
			
		if !collisionCounter:
			moveUp(neededMovement)
			
			
			return true	
			
		for i in range(simulatedPosition.size()):
			simulatedPosition[i] -= Vector2(0, 1)	
	
	
	
	return tryDown()
	
func tryDown():
	var addCount = 0
	var neededMovement = 0
	var collisionCounter = false
	var simulatedPosition = pieceHeight.duplicate()
	
	neededMovement = 0
	collisionCounter = false	
	
	while neededMovement <= 2:
		addCount += 1
		collisionCounter = false	
		for tile in simulatedPosition:
			if table.get_cell_tile_data(globalPiecePosition + tile):
				
				collisionCounter = true
				neededMovement += 1
				break	
			
		if !collisionCounter:
			moveDown(neededMovement)
				
			
			return true	
			
		for i in range(simulatedPosition.size()):
			simulatedPosition[i] += Vector2(0, 1)	
	
	
	if !isDoubleChecking:
		isDoubleChecking = true	
		return tryRight()
	else:
		return false	
func checkForAvailableRotations():
	return tryRight()
func clearPiece():
	for tile in pieceHeight:
		erase_cell(tile)
	for tile in pieceLength:
		erase_cell(tile)	
func rotTo90():
	pass
func rotTo180():
	pass
func rotTo270():
	pass
func rotTo0():
	pass

func rotatePiece():
	var pos = rot % 360
	var sprite = Vector2(1, 0)
	match pos:
		90:
			rotTo90()
		180:
			rotTo180()
		270:
			rotTo270()
		0:
			rotTo0()
