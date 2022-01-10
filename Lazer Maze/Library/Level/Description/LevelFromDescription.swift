extension Level {
	convenience init(description: String) {
		let rows = description.split(separator: "\n")
		let map = rows.map { $0.split(separator: " ") }
		
		if map[0].contains("~~") {
			
		}
	}
}
