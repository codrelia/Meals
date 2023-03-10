import SwiftUI

// MARK: - General View for random dishes

struct RandomDishesView: View {
    // MARK: - OBSERVED_OBJECT PROPERTIES
    
    @ObservedObject var viewModel: MealsViewModels
    
    // MARK: - STATE PROPERTIES
    
    @State var isFavorite = false
    
    // MARK: - MAIN BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32.0) {
                ForEach(0..<1) { i in
                    VStack {
                        CardDishes(isFavorite: $isFavorite, currentDishes: viewModel.randomMeal)
                    }
                    .padding(.trailing, i == 3 ? 16.0 : 0.0)
                    .padding(.leading, 16.0)
                }
            }
        }
    }
}

// MARK: - One card for a dish

struct CardDishes: View {
    // MARK: - BINDING PROPERTIES
    
    @Binding var isFavorite: Bool
    
    // MARK: - PROPERTIES
    
    var currentDishes: Meal?
    
    
    // MARK: - MAIN BODY
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                AsyncImage(url: URL(string: currentDishes?.strMealThumb ?? ""))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 257.0, height: 419.0)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                VStack(alignment: .trailing) {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isFavorite.toggle()
                        }, label: {
                            Image(systemName: (isFavorite ? "heart.fill" : "heart"))
                                .resizable()
                                .foregroundColor(.white)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 24.0, height: 24.0)
                                .padding([.trailing, .bottom], 16.0)
                        })
                    }
                }
                .frame(width: 257.0, height: 419.0)
            }
            Text(currentDishes?.strMeal ?? "")
                .font(.system(size: 16.0, weight: .semibold))
                .padding(.top, 8.0)
                .frame(width: 257.0, alignment: .leading)
                .lineLimit(2)
            Text(currentDishes?.strArea ?? "")
                .font(.system(size: 16.0, weight: .semibold))
                .foregroundColor(.black.opacity(0.5))
        }
    }
}

// MARK: - PREVIEW

struct RandomDishesView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RandomDishesView(viewModel: MealsViewModels())
        }
    }
}
