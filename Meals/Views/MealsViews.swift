import SwiftUI

struct MealsViews: View {
    @State var searchText = ""
    var body: some View {
        VStack {
            SearchBar()
            Spacer()
            TabBar()
        }
    }
}

struct MealsViews_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MealsViews()
                .navigationTitle("Meals")
        }
    }
}
