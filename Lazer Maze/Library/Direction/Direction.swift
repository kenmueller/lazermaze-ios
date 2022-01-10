enum Direction {
	case horizontal(value: Horizontal)
	case vertical(value: Vertical)
	case diagonal(vertical: Vertical, horizontal: Horizontal)
}
