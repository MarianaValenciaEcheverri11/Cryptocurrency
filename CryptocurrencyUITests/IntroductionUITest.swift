//
//  IntroductionUITest.swift
//  CryptocurrencyUITests
//
//  Created by Mariana Valencia Echeverri on 27/08/23.
//

import XCTest
@testable import Cryptocurrency

final class IntroductionUITest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let view = XCUIApplication()
        view.launchArguments = ["isRunningUITests"]
        view.launch()
        let accessWalletButton = view.buttons["ACCESS WALLET"]
        let generateWallet = view.buttons["GENERATE NEW WALLET"]
        let capture = view.buttons["OR CAPTURE"]
        accessWalletButton.tap()
        generateWallet.tap()
        capture.tap()
        
        XCTAssertTrue(accessWalletButton.exists)
        XCTAssertTrue(generateWallet.exists)
        XCTAssertTrue(capture.exists)

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

}
