//
//  HomeViewModel.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import Foundation

protocol HomeViewModelProtocol {
    func viewDidLoad() async
}

public class HomeViewmodel: HomeViewModelProtocol {
    
    // MARK: - Public properties -
    
    public var view: HomeViewDelegate?
    public var services = Services()
    
    // MARK: - Public methods -

    public func viewDidLoad() async {
        await getCryptoCurrencies()
    }
}

extension HomeViewmodel {
    
    func getCryptoCurrencies() async {
        do {
            let listCoins = try await services.getListCriptoCurrencyAsync()
            DispatchQueue.main.async {
                self.view?.displayCoins(with: listCoins)
            }
        } catch {
            print(error)
        }
    }
}
