import SwiftUI

struct TabBarView: View {
    @State var selectedTab: String = "Meals"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
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

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
