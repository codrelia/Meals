import SwiftUI

struct TabBarView: View {
    
    // MARK: - STATE PROPERTIES
    
    @State var selectedTab: String = "Meals"
    
    // MARK: - INITIALIZATION
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: - MAIN BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                TabView(selection: $selectedTab) {
                    MainView()
                        .tag("Meals")
                    FavoritesView()
                        .tag("Favorites")
                }
            }
            TabBar(selectedTab: $selectedTab)
        }
    }
}

// MARK: - PREVIEW
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
