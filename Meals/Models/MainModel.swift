import Foundation

// MARK: - Model
struct MainModel: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let idMeal, strMeal, strCategory, strArea: String
    let strInstructions: String
    let strMealThumb: String
}
