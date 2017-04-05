//
//  restaurantlistUITests.swift
//  restaurantlistUITests
//
//  Created by Nicole Thomas on 2017-04-05.
//  Copyright © 2017 Grazietta Hof. All rights reserved.
//

import XCTest

class restaurantlistUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        
        let app2 = app
        app2.tables.staticTexts["Tim Hortons"].tap()
        app2.pickerWheels["Low Calories"].tap()
        
        let element = app.scrollViews.children(matching: .other).element(boundBy: 0)
        element.tap()
        
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier:"grilled cheese panini").buttons["Nutritional Info"].tap()
        let gotchaButton = app.alerts["TimHortons"].buttons["Gotcha!"]
        gotchaButton.tap()
        
        let lowFatPickerWheel = app2.pickerWheels["Low Fat"]
        let nutritionalInfoButton = tablesQuery.cells.containing(.staticText, identifier:"harvest vegetable soup").buttons["Nutritional Info"]
        nutritionalInfoButton.tap()
        gotchaButton.tap()
        
    }
    func test1() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Donair Town"].tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.children(matching: .other).element(boundBy: 0).tap()
        tablesQuery.cells.containing(.staticText, identifier:"Greek Salad").buttons["Nutritional Info"].tap()
        app.alerts["DonairTown"].buttons["Gotcha!"].tap()
        
        let app2 = app
        app2.pickerWheels["Low Carb"]
        app.navigationBars["restaurantlist.ItemView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        tablesQuery.staticTexts["Poke Bar"].tap()
        scrollViewsQuery.children(matching: .other).element(boundBy: 7).tap()
        scrollViewsQuery.children(matching: .other).element(boundBy: 4).tap()
        tablesQuery.buttons["Nutritional Info"].tap()
        
        let gotchaButton = app.alerts["PokeBar"].buttons["Gotcha!"]
        gotchaButton.tap()
        app.navigationBars["restaurantlist.ItemView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["restaurantlist.View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        
    }
    
    
    func test2(){
        
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        app.navigationBars["restaurantlist.View"].buttons["All Food Items"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        app.alerts["TimHortons\nBLT sandiwch"].buttons["Gotcha!"].tap()
        
        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("ham")
        
        element.tap()
        app.alerts["Subway\nHam Sub"].buttons["Gotcha!"].tap()
        element.tap()
        app.alerts["Subway\nTurkey Breast & Ham Salad"].buttons["Gotcha!"].tap()
        app.buttons["Cancel"].tap()
        app.navigationBars["restaurantlist.ItemView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["restaurantlist.View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    func test3(){
        
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        
        let app2 = app
        app2.tables.staticTexts["Spicy Stone"].tap()
        app.scrollViews.children(matching: .other).element(boundBy: 4).tap()
        
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier:"Kimbob Classic with Miso").buttons["Nutritional Info"].tap()
        
        let gotchaButton = app.alerts["SpicyStone"].buttons["Gotcha!"]
        gotchaButton.tap()
        let lowCaloriesPickerWheel = app2.pickerWheels["Low Calories"]
        let lowCarbPickerWheel = app2.pickerWheels["Low Carb"]
        
        tablesQuery.cells.containing(.staticText, identifier:"1/2 Kimbob ").buttons["Nutritional Info"].tap()
        gotchaButton.tap()
        app.navigationBars["restaurantlist.ItemView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["restaurantlist.View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
    func test4(){
        
        
        let app = XCUIApplication()
        app.buttons["Dine In"].tap()
        
        let collectionViewsQuery = app.collectionViews
        let ingredientTextField = collectionViewsQuery.textFields["Ingredient"]
        ingredientTextField.tap()
        ingredientTextField.typeText("apple")
        
        let addButton = collectionViewsQuery.buttons["Add"]
        addButton.tap()
        ingredientTextField.tap()
        ingredientTextField.typeText("tomato")
        addButton.tap()
        
        let searchButton = app.buttons["Search"]
        searchButton.tap()
        app.tables.staticTexts["\"Simple Slow-cooked Lasagna\t\""].tap()
        app.navigationBars["restaurantlist.webView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["restaurantlist.recipeTableView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["restaurantlist.EatInView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
    func test5(){
        
        
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.searchFields["Search"].tap()
        app.searchFields["Search"].typeText("tim hortons")
        
        let window = app.children(matching: .window).element(boundBy: 0)
        window.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.scrollViews.children(matching: .other).element(boundBy: 4).tap()
        tablesQuery.cells.containing(.staticText, identifier:"chili").buttons["Nutritional Info"].tap()
        app.alerts["TimHortons"].buttons["Gotcha!"].tap()
        app.navigationBars["restaurantlist.ItemView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.buttons["Cancel"].tap()
        
    }
    

    func test7() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        app.buttons["Dine In"].tap()
        
        let collectionViewsQuery = app.collectionViews
        let ingredientTextField = collectionViewsQuery.textFields["Ingredient"]
        ingredientTextField.tap()
        ingredientTextField.typeText("tomato")
        
        let addButton = collectionViewsQuery.buttons["Add"]
        addButton.tap()
        ingredientTextField.tap()
        ingredientTextField.typeText("cheese")
        addButton.tap()
        app.buttons["Search"].tap()
        
        
        let backButton = app.navigationBars["restaurantlist.webView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
        backButton.tap()
        app.navigationBars["restaurantlist.recipeTableView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        collectionViewsQuery.staticTexts["Cheese"].tap()
        collectionViewsQuery.staticTexts["Tomato"].tap()
        
        addButton.tap()
        
        ingredientTextField.tap()
        ingredientTextField.typeText("   ")
        addButton.tap()
        app.buttons["Search"].tap()
        app.alerts["Error"].buttons["Ok"].tap()
        app.navigationBars["restaurantlist.EatInView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        
    }
    
}
