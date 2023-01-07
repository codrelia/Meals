import SwiftUI

struct MealsViews: View {
    @State var searchText = ""
    var body: some View {
        VStack {
            Spacer()
            CustomTabBar()
        }.searchable(text: $searchText)
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
