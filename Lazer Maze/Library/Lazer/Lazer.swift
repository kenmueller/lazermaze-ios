final class Lazer {
	static let items = ["^^", "vv", "<<", ">>", "//", "\\"]
	
	let position: Level.Border
	let direction: Direction
	
	init(at position: Level.Border, to direction: Direction) {
		self.position = position
		self.direction = direction
	}
}
