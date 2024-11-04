//
//  MyHelloCoffeeE2ETests.swift
//  MyHelloCoffeeE2ETests
//
//  Created by Jean on 03/11/24.
//



import XCTest

final class when_deleting_an_order: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        // go to the add order screen
        app.buttons["addNewOrderButton"].tap()
        // write into textfields
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        nameTextField.tap()
        nameTextField.typeText("John")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Hot Coffee")
        
        priceTextField.tap()
        priceTextField.typeText("4.50")
        
        // place the order
        placeOrderButton.tap()
        
    }
    
    func test_should_delete_order_successfully() {
                      
        XCUIApplication().collectionViews/*@START_MENU_TOKEN@*/.staticTexts["coffeePriceText"]/*[[".cells",".staticTexts[\"4,50 €\"]",".staticTexts[\"coffeePriceText\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        

        let orderList = app.collectionViews["orderList"]
        XCTAssertEqual(0, orderList.cells.count)
    }
    
    // TEAR DOWN FUNCTIONS RUNS AND THEN DELETE ALL ORDERS FROM THE TEST DATABASE
    override func tearDown() {
        Task {
            guard let url = URL(string: "/clear-orders", relativeTo: URL(string: "https://metal-happy-parsnip.glitch.me")!) else { return }
            let (_, _) = try! await URLSession.shared.data(from: url)
        }
    }
}


final class when_adding_a_new_coffee_order: XCTestCase {
    
    private var app: XCUIApplication!
    
    // called before running each test
    override func setUp() {
        
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        // go to place order screen
        app.buttons["addNewOrderButton"].tap()
        // fill out the textfields
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        nameTextField.tap()
        nameTextField.typeText("John")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Hot Coffee")
        
        priceTextField.tap()
        priceTextField.typeText("4.50")
        
        // place the order
        placeOrderButton.tap()
    }
     
    func test_should_display_coffee_order_in_list_successfully() throws {
        
        XCTAssertEqual("John", app.staticTexts["orderNameText"].label)
        XCTAssertEqual("Hot Coffee (Medium)", app.staticTexts["coffeeNameAndSizeText"].label)
        XCTAssertEqual("4,50 €", app.staticTexts["coffeePriceText"].label)
    }
    //XCTAssertEqual failed: ("$4.50") is not equal to ("4,50 €")
    
    // called after running each test
    override func tearDown() {
        Task {
            guard let url = URL(string: "/clear-orders", relativeTo: URL(string: "https://metal-happy-parsnip.glitch.me")!) else { return }
            let (_, _) = try! await URLSession.shared.data(from: url)
        }
    }
    
}


final class when_app_is_launched_with_no_orders: XCTestCase {

    func test_should_make_sure_no_orders_message_is_displayed() {
        
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
        
        XCTAssertEqual("No orders available!", app.staticTexts["noOrdersText"].label)
    }

    
}

