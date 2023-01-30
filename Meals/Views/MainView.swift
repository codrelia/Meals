import SwiftUI

struct MainView: View {
    
    // MARK: - STATE PROPERTIES
    
    @State var searchText = ""
    
    // MARK: - OBSERVED_OBJECTS
    @ObservedObject var viewModel = MealsViewModels()
    
    
    // MARK: - MAIN BODY
    var body: some View {
        ZStack(alignment: .top) {
            Color.primary
                .edgesIgnoringSafeArea(.all)
                .zIndex(0)
            NavigationView {
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
                    .refreshable {
                        viewModel.takeRandomMeal()
                    }
                }
                .navigationTitle("Meals")
            }
            .zIndex(1)
            if let error = viewModel.errorMessage{
                ErrorView(errorMessage: error)
                    .transition(.asymmetric(
                        insertion: .move(edge: .top),
                        removal: .slide))
                    .animation(.spring())
                    .zIndex(2)
            }
        }
    }
}

// MARK: - PREVIEW

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .navigationTitle("Meals")
    }
}
