extension Piece {
	enum Direction {
		case single(x: Lazer_Maze.Direction)
		case double(x: Lazer_Maze.Direction, y: Lazer_Maze.Direction)
	}
}
