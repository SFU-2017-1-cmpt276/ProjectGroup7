//
//  restaurantlistUITests.swift
//  restaurantlistUITests
//
//  Created by Nicole Thomas on 2017-03-28.
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
        
        func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 5,  file: String = #file, line: UInt = #line) {
            let existsPredicate = NSPredicate(format: "exists == true")
            
            expectation(for: existsPredicate,
                        evaluatedWith: element, handler: nil)
            
            waitForExpectations(timeout: timeout) { (error) -> Void in
                if (error != nil) {
                    let message = "Failed to find \(element) after \(timeout) seconds."
                    self.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
                }
            }
        }
        
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.cells.containing(.staticText, identifier:"Poke Bar").staticTexts["..."].tap()
        tablesQuery.cells.containing(.staticText, identifier:"Toona Spicy").buttons["Nutritional Info"].tap()
        app.alerts["Toona Spicy"].buttons["Gotcha!"].tap()
        
        let element2 = app.otherElements.containing(.navigationBar, identifier:"restaurantlist.ItemView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element(boundBy: 5)
        element.tap()
        element.tap()
        app.pickerWheels["Low Calories"].press(forDuration: 2.6);
        tablesQuery.cells.containing(.staticText, identifier:"Calfornia Dreamin'").buttons["Nutritional Info"].tap()
        app.alerts["Calfornia Dreamin'"].buttons["Gotcha!"].tap()
        
        let backButton = app.navigationBars["restaurantlist.ItemView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
        backButton.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Big Smoke Burgers").staticTexts["..."].tap()
        element2.children(matching: .other).element(boundBy: 9).tap()
        tablesQuery.cells.containing(.staticText, identifier:"Ice Cream Sandwich").buttons["Nutritional Info"].tap()
        app.alerts["Ice Cream Sandwich"].buttons["Gotcha!"].tap()
        backButton.tap()
        /*app.navigationBars["restaurantlist.View"].buttons["All Food Items"].tap()
        let searchSearchField = app.searchFields["Search"]
        //waitForElementToAppear(element: searchSearchField)
        searchSearchField.tap()
        searchSearchField.typeText("burger")
        app.typeText("\r")
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.alerts["HighlandsPub\nVeggie Burger"].buttons["Gotcha!"].tap()*/
        
     
        
        
    }
    
   /*func test2(){
        
     func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 5,  file: String = #file, line: UInt = #line) {
     let existsPredicate = NSPredicate(format: "exists == true")
     
     expectation(for: existsPredicate,
     evaluatedWith: element, handler: nil)
     
     waitForExpectations(timeout: timeout) { (error) -> Void in
     if (error != nil) {
     let message = "Failed to find \(element) after \(timeout) seconds."
     self.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
     }
     }
     }
     
        let app = XCUIApplication()
        app.buttons["Eat at home"].tap()
        let collectionViewsQuery = app.collectionViews
        let ingredientTextField = collectionViewsQuery.textFields["Ingredient"]
        ingredientTextField.tap()
        ingredientTextField.typeText("cheese")
        let addButton = collectionViewsQuery.buttons["Add"]
        addButton.tap()
     
     /*let collectionViewsQuery = XCUIApplication().collectionViews
     collectionViewsQuery.staticTexts["Cheese"].tap()
     
     let ingredientTextField = collectionViewsQuery.textFields["Ingredient"]
     ingredientTextField.tap()
     ingredientTextField.typeText("bread")
     collectionViewsQuery.buttons["Add"].tap()
     collectionViewsQuery.staticTexts["Bread"].tap()*/
     
        let element = collectionViewsQuery.staticTexts["Cheese"]
        waitForElementToAppear(element: element)
        ingredientTextField.tap()
        ingredientTextField.typeText("ham")
        addButton.tap()
        ingredientTextField.tap()
        ingredientTextField.typeText("onion")
        addButton.tap()
        ingredientTextField.tap()
        ingredientTextField.typeText("garlic")
        addButton.tap()
        ingredientTextField.tap()
        ingredientTextField.typeText("bread")
        addButton.tap()
        app.buttons["Search"].tap()
        
        
        
    }
    
   func test3(){
        
        
        let app = XCUIApplication()
        app.buttons["Eat out"].tap()
        app.navigationBars["restaurantlist.View"].buttons["All Food Items"].tap()
        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("burger")
        app.typeText("\r")
        app.tables.cells.containing(.staticText, identifier:"Graduate Burger").buttons["Nutritional Info"].tap()
        app.alerts["ClubIlia\nGraduate Burger"].buttons["Gotcha!"].tap()
        
        
    }*/
}
