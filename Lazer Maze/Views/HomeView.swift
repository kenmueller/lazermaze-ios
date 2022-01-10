import SwiftUI

let level = try! Level(fromDescription: Level.descriptions[0])

struct HomeView: View {
	var body: some View {
		LazyVGrid(columns: Array(repeating: .init(.flexible()), count: level.cells[0].count)) {
			ForEach(Array(level.cells.enumerated()), id: \.offset) { _, row in
				ForEach(Array(row.enumerated()), id: \.offset) { _, cell in
					switch cell.category {
					case let .piece(piece):
						Text("\(cell.hasStar ? "star " : "")\(piece.icon)")
					case .block:
						Text("block")
					case .empty:
						Text(cell.hasStar ? "star" : "empty")
					}
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
