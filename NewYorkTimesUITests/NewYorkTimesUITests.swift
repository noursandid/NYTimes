//
//  NewYorkTimesUITests.swift
//  NewYorkTimesUITests
//
//  Created by Nour Sandid on 2/23/19.
//  Copyright © 2019 NewYorkTimes. All rights reserved.
//

import XCTest

class NewYorkTimesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        
    }

    func testExample() {
        let app = XCUIApplication()

        if app.buttons.element(boundBy: 0).exists {
            app.buttons.element(boundBy: 0).tap()
        }
        else{
            XCUIDevice.shared.orientation = .landscapeRight
            XCUIDevice.shared.orientation = .portrait
            app.tables.element(boundBy: 0).swipeUp()
            app.tables.element(boundBy: 0).swipeDown()
            if app.tables.cells.allElementsBoundByIndex.count > 0 && app.tables.cells.allElementsBoundByIndex.first!.exists {
                app.tables.cells.allElementsBoundByIndex.first!.tap()
            }
            
            XCUIDevice.shared.orientation = .landscapeRight
            XCUIDevice.shared.orientation = .portrait
        }
        
        
    }

}
