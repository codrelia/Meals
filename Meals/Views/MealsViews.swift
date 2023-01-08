import SwiftUI

struct MealsViews: View {
    @State var searchText = ""
    
    @ObservedObject var viewModel = MealsViewModels()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                ScrollView {
                    SearchBar()
                    Spacer()
                    VStack {
                        CategoriesView()
                        VStack(alignment: .leading) {
                            Text("Random Dishes")
                                .font(.system(size: 20.0, weight: .semibold, design: .default))
                                .padding(.top, 8.0)
                                .padding(.horizontal, 16.0)
                            RandomDishesView(viewModel: viewModel)
                                .padding(.bottom, 100.0)
                        }
                    }
                }
            }
            VStack {
                Spacer()
                TabBar()
            }
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
