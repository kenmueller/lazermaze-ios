extension Level {
	final class Exit {
		let position: Border
		
		init(at position: Border) {
			self.position = position
		}
		
		var icon: String {
			switch position {
			case let .vertical(vertical, _):
				switch vertical {
				case .up:
					return #"^^"#
				case .down:
					return #"vv"#
				}
			case let .horizontal(horizontal, _):
				switch horizontal {
				case .left:
					return #"<<"#
				case .right:
					return #">>"#
				}
			}
		}
	}
}
