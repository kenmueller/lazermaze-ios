import SwiftUI

fileprivate let level = try! Level(fromDescription: Level.descriptions[0])

struct Cell: View {
	let level: Level
	let cell: Level.Cell
	
	let position: CGPoint
	
	init(_ cell: Level.Cell, in level: Level, at position: CGPoint) {
		self.level = level
		self.cell = cell
		self.position = position
	}
	
	var value: String {
		var result = ""
		
		switch cell.category {
		case let .piece(piece):
			if cell.hasStar { result += "star " }
			result += piece.icon
		case .block:
			result += "block"
		case .empty:
			result += cell.hasStar ? "star" : "empty"
		}
		
		if position.y == 0, case .vertical(.up, at: .init(position.x)) = level.lazer.position {
			result = "\(level.lazer.icon) \(result)"
		} else if position.y == .init(level.cells.count - 1), case .vertical(.down, at: .init(position.x)) = level.lazer.position {
			result = "\(level.lazer.icon) \(result)"
		} else if position.x == 0, case .horizontal(.left, at: .init(position.y)) = level.lazer.position {
			result = "\(level.lazer.icon) \(result)"
		} else if position.x == .init(level.cells[0].count - 1), case .horizontal(.right, at: .init(position.y)) = level.lazer.position {
			result = "\(level.lazer.icon) \(result)"
		}
		
		if position.y == 0, case .vertical(.up, at: .init(position.x)) = level.exit.position {
			result = "\(level.exit.icon) \(result)"
		} else if position.y == .init(level.cells.count - 1), case .vertical(.down, at: .init(position.x)) = level.exit.position {
			result = "\(level.exit.icon) \(result)"
		} else if position.x == 0, case .horizontal(.left, at: .init(position.y)) = level.exit.position {
			result = "\(level.exit.icon) \(result)"
		} else if position.x == .init(level.cells[0].count - 1), case .horizontal(.right, at: .init(position.y)) = level.exit.position {
			result = "\(level.exit.icon) \(result)"
		}
		
		return result
	}
	
	var body: some View {
		Text(value)
	}
}

struct HomeView: View {
	var columns: [GridItem] {
		.init(repeating: .init(.flexible()), count: level.cells[0].count)
	}
	
	var body: some View {
		LazyVGrid(columns: columns, spacing: 5) {
			ForEach(Array(level.cells.enumerated()), id: \.offset) { rowIndex, row in
				ForEach(Array(row.enumerated()), id: \.element) { columnIndex, cell in
					Cell(cell, in: level, at: .init(x: columnIndex, y: rowIndex))
				}
			}
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
