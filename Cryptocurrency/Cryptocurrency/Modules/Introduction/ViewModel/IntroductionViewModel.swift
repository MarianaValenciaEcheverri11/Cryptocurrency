//
//  IntroductionViewModel.swift
//  Cryptocurrency
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import Foundation

protocol IntroductionViewModelProtocol {
    func navigateToHome()
}

public class IntroductionViewModel: IntroductionViewModelProtocol {
    
    // MARK: - Public properties -
    
    public var view: IntroductionViewDelegate?
    
    // MARK: - Public methods -

    public func navigateToHome() {
        self.view?.navigateToHome()
    }
}
