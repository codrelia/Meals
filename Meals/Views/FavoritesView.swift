import SwiftUI

struct FavoritesView: View {
    // MARK: - MAIN BODY
    
    var body: some View {
        NavigationView {
            Text("Favorites")
                .navigationTitle("Favorites")
        }
    }
}

// MARK: - PREVIEW

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
