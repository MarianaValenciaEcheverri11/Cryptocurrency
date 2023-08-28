//
//  DetailTest.swift
//  CryptocurrencyTests
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import XCTest
@testable import Cryptocurrency

final class DetailTest: XCTestCase {
    
    private var validateCoin: CryptocurrencyModel =  CryptocurrencyModel(id: "12", symbol: "CM", name: "CAM",
                                                                         image: CriptocurrencyImageModel(thumb: "", small: "", large: ""),
                                                                         market_data: CriptocurrencyMarketDataModel(
                                                                            price_change_24h: 12321, price_change_percentage_24h: -12312.2))
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_when_createModule_then_detailDontNil() {
        //Given
        let uiViewController = DetailCoinView(validateCoin)
        
        guard let viewModel = uiViewController.viewModel else {
            XCTFail()
            return
        }
        
        //Then
        XCTAssertNotNil(viewModel)
        
    }
}
