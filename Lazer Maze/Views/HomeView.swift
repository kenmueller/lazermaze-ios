import SwiftUI

struct HomeView: View {
	@State
	var started = false
	
	var body: some View {
		Text("HomeView")
			.font(.default(size: 16, weight: .bold))
			.navigationTitle("Lazer Maze")
			.navigationBarTitleDisplayMode(.inline)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			HomeView()
				.environment(\.managedObjectContext, Persistence.preview.context)
		}
	}
}
