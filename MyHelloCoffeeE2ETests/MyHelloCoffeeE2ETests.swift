//
//  MyHelloCoffeeE2ETests.swift
//  MyHelloCoffeeE2ETests
//
//  Created by Jean on 03/11/24.
//

import XCTest

final class when_app_is_launched_with_no_orders: XCTestCase {



    @MainActor
    func test_should_make_sure_no_orderrs_message_is_displayed() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV" : "TEST"]
        app.launch()
        
      XCTAssertEqual("No orders available!", app.staticTexts["noOrdersText"].label)
    }

 
}
