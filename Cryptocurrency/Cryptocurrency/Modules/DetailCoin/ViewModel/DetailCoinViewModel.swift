//
//  DetailCoinViewModel.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import Foundation

protocol DetailCoinViewModelProtocol {
    func viewBack()
}

public class DetailCoinViewModel: DetailCoinViewModelProtocol {
    
    // MARK: - Public properties -
    
    public var view: DetailCoinView?
    
    // MARK: - Public methods -

    public func viewBack() {
        self.view?.viewBack()
    }
}
