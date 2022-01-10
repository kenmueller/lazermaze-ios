extension Piece {
	enum Direction {
		case single(Lazer_Maze.Direction)
		case double(Lazer_Maze.Direction, Lazer_Maze.Direction)
	}
}
