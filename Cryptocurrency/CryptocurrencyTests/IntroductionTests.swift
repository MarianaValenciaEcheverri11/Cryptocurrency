//
//  IntroductionTests.swift
//  CryptocurrencyTests
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import XCTest
@testable import Cryptocurrency

final class IntroductionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_when_createModule_then_introductionDontNil() {
        //Given
        let uiViewController = IntroductionView()
        
        guard let viewModel = uiViewController.viewModel else {
            XCTFail()
            return
        }
        
        //Then
        XCTAssertNotNil(viewModel)
    }
}

