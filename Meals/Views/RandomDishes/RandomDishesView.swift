//
//  RandomDishesView.swift
//  Meals
//
//  Created by Дарья Шевченко on 08/01/2023.
//

import SwiftUI

struct RandomDishesView: View {
    @ObservedObject var viewModel: MealsViewModels
    @State var isFavorite = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32.0) {
                ForEach(0..<1) { i in
                    VStack(alignment: .leading) {
                        ZStack {
                            AsyncImage(url: URL(string: viewModel.randomMeal?.strMealThumb ?? ""))
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 257.0, height: 419.0)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            VStack(alignment: .trailing) {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        isFavorite = !isFavorite
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
                        Text(viewModel.randomMeal?.strMeal ?? "")
                            .font(.system(size: 16.0, weight: .semibold))
                            .padding(.top, 8.0)
                            .frame(width: 257.0, alignment: .leading)
                            .lineLimit(2)
                        Text(viewModel.randomMeal?.strArea ?? "")
                            .font(.system(size: 16.0, weight: .semibold))
                            .foregroundColor(.black.opacity(0.5))
                    }
                    .padding(.trailing, i == 3 ? 16.0 : 0.0)
                    .padding(.leading, 16.0)
                }
            }
        }
    }
}

struct RandomDishesView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RandomDishesView(viewModel: MealsViewModels())
        }
    }
}
