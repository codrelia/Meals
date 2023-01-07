import SwiftUI

@main
struct MealsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MealsViews()
                    .navigationTitle("Meals")
            }
        }
    }
}
