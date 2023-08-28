//
//  Services.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import Foundation

public enum CriptocurrencyError: Error {
    case formatIncorrect
    case invalidUrl
}

struct Constants {
    struct Urls {
        static func getListCurrency() -> URL? {
            return URL(string: Apis.BASE_API_URL)
        }
    }
}

public class Services {
    public func getListCriptoCurrencyAsync() async throws -> [CryptocurrencyModel] {
        try await withCheckedThrowingContinuation { continuation in
            getListCriptoCurrency() { result in
                switch result {
                    case .success(let listCoins):
                        continuation.resume(returning: listCoins)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                }
            }
        }
    }
    
    public func getListCriptoCurrency(completion: @escaping (Result<[CryptocurrencyModel], CriptocurrencyError>) -> Void) {
        let urlSession = URLSession.shared
        guard let url = Constants.Urls.getListCurrency() else {
            return completion(.failure(.invalidUrl))
        }
        urlSession.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    let pokemons = try JSONDecoder().decode([CryptocurrencyModel].self, from: data)
                    completion(.success(pokemons))
                }
            } catch {
                completion(.failure(.formatIncorrect))
            }
        }.resume()
    }
}
