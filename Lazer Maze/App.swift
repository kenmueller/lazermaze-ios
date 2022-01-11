import SwiftUI

@main
struct LazerMazeApp: App {
	init() {
		UINavigationBar.appearance().largeTitleTextAttributes = [
			.font: UIFont.default(size: 16, weight: .regular)
		]
	}
	
	var body: some Scene {
		WindowGroup {
			NavigationView {
				HomeView()
					.environment(\.managedObjectContext, Persistence.shared.context)
			}
		}
	}
}
