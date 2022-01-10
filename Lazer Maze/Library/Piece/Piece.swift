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
			if double { return #"||"# }
			
			switch horizontal {
			case .left:
				return #"<|"#
			case .right:
				return #"|>"#
			}
		case let .vertical(vertical):
			if double { return #"--"# }
			
			switch vertical {
			case .up:
				return #"-^"#
			case .down:
				return #"-v"#
			}
		case let .diagonal(vertical, horizontal):
			switch vertical {
			case .up:
				switch horizontal {
				case .left:
					return double ? #"//"# : #"</"#
				case .right:
					return double ? #"\\"# : #"\>"#
				}
			case .down:
				switch horizontal {
				case .left:
					return double ? #"\\"# : #"<\"#
				case .right:
					return double ? #"//"# : #"/>"#
				}
			}
		}
	}
}
