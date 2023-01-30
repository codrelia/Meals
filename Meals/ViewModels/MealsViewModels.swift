import Foundation

// MARK: - Main View Models for MVVM

class MealsViewModels: NetworkConnection, ObservableObject {
    
    // MARK: - Published properties
    @Published var randomMeal: Meal?
    @Published var errorMessage: String?
    
    // MARK: - Initialization
    override init() {
        super.init()
        
        takeRandomMeal()
    }
    
    /// Allows you to take a random dish from the server
    func takeRandomMeal() {
        request(path: .randomMeal) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                let model = try? JSONDecoder().decode(MainModel.self, from: data)
                guard let model = model else {
                    self.errorMessage = "Internal application error!"
                    return
                }
                DispatchQueue.main.async {
                    self.randomMeal = model.meals[0]
                }
            case .failure(_):
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.errorMessage = "Internet connection error! Please try again."
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.errorMessage = nil
                }
            }
        }
    }
}
