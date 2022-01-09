import SwiftUI

@main
struct LazerMazeApp: App {
	let persistence = Persistence.shared
	
	var body: some Scene {
		WindowGroup {
			HomeView()
				.environment(\.managedObjectContext, persistence.context)
		}
	}
}
