import SwiftUI

struct TabBarView: View {
    var tabBarItems = ["Meals", "Favorites"]
    
    @State var selectedTab: String = "1"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                TabView(selection: $selectedTab) {
                    MainView()
                        .tag("1")
                    FavoritesView()
                        .navigationTitle("Favorites")
                        .tag("2")
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
