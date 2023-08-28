//
//  HomeTest.swift
//  CryptocurrencyTests
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import XCTest
@testable import Cryptocurrency

final class HomeTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_when_createModule_then_homeDontNil() {
        //Given
        let uiViewController = HomeView()
        
        guard let viewModel = uiViewController.viewModel else {
            XCTFail()
            return
        }
        
        //Then
        XCTAssertNotNil(viewModel)
        
    }
}
