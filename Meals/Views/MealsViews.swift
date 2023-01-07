import SwiftUI

struct MealsViews: View {
    var body: some View {
        VStack {
            Spacer()
            CustomTabBar()
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
