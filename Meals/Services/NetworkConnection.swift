import Foundation

class NetworkConnection {
    private var domain = "https://www.themealdb.com/api/json/v1/1/"
    
    func request(path: Urls, completion: @escaping (Result<Data, Error>) -> ())  {
        let url = URL(string: domain + path.rawValue)
        guard let url = url else {
            print("Placeholder for error url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if data != nil {
                completion(.success(data!))
            } else {
                completion(.failure(error!))
            }
        }.resume()
        
    }
}
