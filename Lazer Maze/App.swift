import SwiftUI

@main
struct LazerMazeApp: App {
	var body: some Scene {
		WindowGroup {
			NavigationView {
				HomeView()
					.navigationBarHidden(true)
					.environment(\.managedObjectContext, Persistence.shared.context)
			}
		}
	}
}
