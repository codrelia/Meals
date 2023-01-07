import SwiftUI

struct MealsViews: View {
    @State var searchText = ""
    @State var isVisibleSearchBar = true
    
    var body: some View {
        VStack {
            ScrollView {
                SearchBar()
                Spacer()
                VStack {
                    VStack(alignment: .leading) {
                        Text("Categories")
                            .font(.system(size: 20.0, weight: .semibold, design: .default))
                            .padding(.top, 8.0)
                            .padding(.leading, 16.0)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 40.0) {
                                ForEach(0..<14) { i in
                                    VStack {
                                        Image(arrayOfCategories[i].rawValue.lowercased())
                                            .resizable()
                                            .frame(width: 50.0, height: 50.0)
                                        
                                        Text(arrayOfCategories[i].rawValue)
                                            .font(.system(size: 14.0, weight: .medium))
                                    }
                                    .padding(.trailing, i == 13 ? 16.0 : 0.0)
                                }
                            }
                            .padding(.leading, 16.0)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Random Dishes")
                            .font(.system(size: 20.0, weight: .semibold, design: .default))
                            .padding(.top, 8.0)
                            .padding(.leading, 16.0)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 32.0) {
                                ForEach(0..<3) { i in
                                    VStack(alignment: .leading) {
                                        ZStack {
                                            Image("beef-stroganoff")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 257.0, height: 419.0)
                                                .clipped()
                                                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                                            VStack(alignment: .trailing) {
                                                Spacer()
                                                HStack {
                                                    Spacer()
                                                    Image(systemName: "heart")
                                                        .resizable()
                                                        .foregroundColor(.white)
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 24.0, height: 24.0)
                                                        .padding([.trailing, .bottom], 16.0)
                                                }
                                            }
                                        }
                                        Text("Beef Stroganoff")
                                            .font(.system(size: 16.0, weight: .semibold))
                                            .padding(.top, 8.0)
                                        Text("Russian")
                                            .font(.system(size: 16.0, weight: .semibold))
                                            .foregroundColor(.black.opacity(0.5))
                                    }
                                    .padding(.trailing, i == 3 ? 16.0 : 0.0)
                                }
                            }
                        }
                        .padding(.leading, 16.0)
                    }
                }
            }
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
