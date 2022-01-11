extension Level {
	final class Lazer {
		static let items = ["^^", "vv", "<<", ">>", "//", "\\"]
		
		let position: Level.Border
		let direction: Direction
		
		init(at position: Level.Border, to direction: Direction) {
			self.position = position
			self.direction = direction
		}
		
		var icon: String {
			switch direction {
			case let .horizontal(horizontal):
				switch horizontal {
				case .left:
					return #"<<"#
				case .right:
					return #">>"#
				}
			case let .vertical(vertical):
				switch vertical {
				case .up:
					return #"^^"#
				case .down:
					return #"vv"#
				}
			case let .diagonal(vertical, horizontal):
				switch (vertical, horizontal) {
				case (.up, .right), (.down, .left):
					return #"//"#
				case (.up, .left), (.down, .right):
					return #"\\"#
				}
			}
		}
	}
}
