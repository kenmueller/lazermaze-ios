import Foundation

extension Level {
	final class Cell: Hashable {
		let id = UUID()
		
		let category: Category
		let hasStar: Bool
		
		init(as category: Category, hasStar: Bool) {
			self.category = category
			self.hasStar = hasStar
		}
		
		static func == (a: Cell, b: Cell) -> Bool {
			a.id == b.id
		}
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}
	}
}
