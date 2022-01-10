extension Level {
	final class Cell {
		let category: Category
		let hasStar: Bool
		
		init(category: Category, hasStar: Bool) {
			self.category = category
			self.hasStar = hasStar
		}
	}
}
