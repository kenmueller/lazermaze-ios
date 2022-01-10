final class Level {
	let cells: [[Cell]]
	
	let lazer: Lazer
	let exit: Exit
	
	init(withCells cells: [[Cell]], lazer: Lazer, exit: Exit) {
		self.cells = cells
		self.lazer = lazer
		self.exit = exit
	}
}
