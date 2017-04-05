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
        
        let tablesQuery2 = app.tables
        let tablesQuery = tablesQuery2
        tablesQuery.staticTexts["Donair Town"].tap()
        tablesQuery2.cells.containing(.staticText, identifier:"Baklava").buttons["Nutritional Info"].tap()
        app.alerts["Baklava"].buttons["Gotcha!"].tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.children(matching: .other).element(boundBy: 4).tap()
        tablesQuery2.cells.containing(.staticText, identifier:"Chicken Salad").buttons["Nutritional Info"].tap()
        app.alerts["Chicken Salad"].buttons["Gotcha!"].tap()
        
        let backButton = app.navigationBars["restaurantlist.ItemView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
        backButton.tap()
        tablesQuery.staticTexts["Poke Bar"].tap()
        tablesQuery2.cells.containing(.staticText, identifier:"Toona Spicy").buttons["Nutritional Info"].tap()
        app.alerts["Toona Spicy"].buttons["Gotcha!"].tap()
        scrollViewsQuery.children(matching: .other).element(boundBy: 0).tap()
        tablesQuery2.cells.containing(.staticText, identifier:"No Swimmin'").buttons["Nutritional Info"].tap()
        
        let gotchaButton = app.alerts["No Swimmin'"].buttons["Gotcha!"]
        gotchaButton.tap()
        backButton.tap()
        app.navigationBars["restaurantlist.View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
    func test1(){
        
        let app = XCUIApplication()
        app.buttons["Dine In"].tap()
        
        let collectionViewsQuery = app.collectionViews
        let ingredientTextField = collectionViewsQuery.textFields["Ingredient"]
        ingredientTextField.tap()
        ingredientTextField.tap()
        ingredientTextField.typeText("cheese")
        
        let addButton = collectionViewsQuery.buttons["Add"]
        addButton.tap()
        ingredientTextField.tap()
        ingredientTextField.typeText("tomato")
        addButton.tap()
        app.buttons["Search"].tap()
        
        app.navigationBars["restaurantlist.recipeTableView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        collectionViewsQuery.staticTexts["Tomato"].tap()
        collectionViewsQuery.staticTexts["Cheese"].tap()
        app.navigationBars["restaurantlist.EatInView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        
    }
    
    func test2(){
        
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.searchFields["Search"].tap()
        app.searchFields["Search"].typeText("Tim Hortons")
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.scrollViews.children(matching: .other).element(boundBy: 4).tap()
        tablesQuery.cells.containing(.staticText, identifier:"chili").buttons["Nutritional Info"].tap()
        
        let gotchaButton = app.alerts["chili"].buttons["Gotcha!"]
        gotchaButton.tap()
        app.navigationBars["restaurantlist.ItemView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.buttons["Cancel"].tap()
        app.navigationBars["restaurantlist.View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
    func test3(){
        
        
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        app.navigationBars["restaurantlist.View"].buttons["All Food Items"].tap()
        
        
        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("burger")
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        app.alerts["HighlandsPub\nChicken Burger"].buttons["Gotcha!"].tap()
        app.buttons["Cancel"].tap()
        
    
    }
    
    func test4(){
        
        let app = XCUIApplication()
        app.buttons["Dine In"].tap()
        
        let searchButton = app.buttons["Search"]
        searchButton.tap()
        
        let okButton = app.alerts["Error"].buttons["Ok"]
        okButton.tap()
        okButton.tap()
        
        let collectionViewsQuery = app.collectionViews
        let ingredientTextField = collectionViewsQuery.textFields["Ingredient"]
        ingredientTextField.tap()
        ingredientTextField.typeText("apple")
        collectionViewsQuery.buttons["Add"].tap()
        searchButton.tap()
        
    }
    
    func test5(){
        
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        
        let app2 = app
        app2.tables.staticTexts["Donair Town"].tap()
        
        let lowCaloriesPickerWheel = app2.pickerWheels["Low Calories"]
        lowCaloriesPickerWheel.press(forDuration: 2.2);
        lowCaloriesPickerWheel.swipeUp()
        
        let lowCarbPickerWheel = app2.pickerWheels["Low Carb"]
        lowCarbPickerWheel.swipeUp()
        app.navigationBars["restaurantlist.ItemView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["restaurantlist.View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
}
