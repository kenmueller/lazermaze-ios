import SwiftUI

struct HomeView: View {
	@State
	var started = false
	
	var body: some View {
		VStack {
			Text("LAZER MAZE")
				.font(.default(size: 30, weight: .regular))
				.foregroundColor(.offWhite)
		}
		.edgesIgnoringSafeArea(.all)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.background)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			HomeView()
				.navigationBarHidden(true)
				.environment(\.managedObjectContext, Persistence.preview.context)
		}
	}
}
