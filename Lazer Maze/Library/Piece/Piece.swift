final class Piece {
	let direction: Direction
	let double: Bool
	
	init(to direction: Direction, double: Bool) {
		self.direction = direction
		self.double = double
	}
	
	var icon: String {
		switch direction {
		case let .horizontal(horizontal):
			switch horizontal {
			case .left:
				return #"<|"#
			case .right:
				return #"|>"#
			}
		case let .vertical(vertical):
			switch vertical {
			case .up:
				return #"-^"#
			case .down:
				return #"-v"#
			}
		case let .diagonal(vertical, horizontal):
			switch (vertical, horizontal) {
			case (.up, .right), (.down, .left):
				return #"\\"#
			case (.up, .left), (.down, .right):
				return #"\\"#
			}
		}
	}
}
