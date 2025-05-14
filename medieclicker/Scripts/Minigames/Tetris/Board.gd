extends TileMapLayer

func setCell(vec, sprite : Vector2, isHeight : bool, globalPiecePosition):
	for tile in vec:
		if (globalPiecePosition + tile).y <= 0:
			$"../../gameOver".play()
			$"../..".lose()
		else: set_cell(globalPiecePosition + tile, 0, sprite)
	if isHeight: #Se llama al metodo por cada linea vertical que contenga la pieza
		checkFullLines(vec,globalPiecePosition)

func checkFullLines(height, globalPiecePosition): #Este metodo comprueba las lineas completas
	var tile
	var linesCleared = 0
	for piece in height:
		var x = travelThroughRow(tile, globalPiecePosition, piece)
		if x == 25: #Si x llega a 24 la fila esta completa, por lo tanto la eliminamos
			linesCleared += 1
			rearengeRows(x, tile, globalPiecePosition, piece)
			$"../..".registerClearedLine(linesCleared)
func travelThroughRow(tile, globalPiecePosition, piece):
	var notNull = true
	var x = 15 
	while x < 25 && notNull: #La grilla (aunque sea tosco) va en ancho desde 15 a 24, asi que recorremos cada tile de la fila a la que pertenece piece
		tile = Vector2(x, globalPiecePosition.y + piece.y)
		if get_cell_tile_data(tile) == null:
			notNull = false
		else: 
			x += 1
	return x

func rearengeRows(x, tile, globalPiecePosition, piece):
	var x2 = 15
	while x2 < 25:
		tile = Vector2(x2, globalPiecePosition.y + piece.y)
		erase_cell(tile)
		x2 += 1
		
		#Las siguientes lineas de codigo bajan los tiles que estan por arriba de la fila eiminada
		var boardHeightToClear = (2 - tile.y) * -1
		var x3 = 1
		while x3 < boardHeightToClear + 1:
			var upperTileCoords = Vector2(tile.x, tile.y - x3)
			if get_cell_tile_data(upperTileCoords) != null:
				set_cell(Vector2(upperTileCoords.x, upperTileCoords.y + 1), 0, get_cell_atlas_coords(upperTileCoords))
				erase_cell(upperTileCoords)
			x3 += 1
