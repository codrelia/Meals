import Foundation

class MealsViewModels: NetworkConnection, ObservableObject {
    @Published var randomMeal: Meal?
    
    override init() {
        super.init()
        
        takeRandomMeal()
    }
    
    func takeRandomMeal() {
        request(path: .randomMeal) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                let model = try? JSONDecoder().decode(MainModel.self, from: data)
                guard let model = model else {
                    print("Placeholder error decoding")
                    return
                }
                DispatchQueue.main.async {
                    self.randomMeal = model.meals[0]
                }
            case .failure(_):
                print("error network")
            }
        }
    }
}
