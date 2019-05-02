//
//  WokExperienceUITests.swift
//  ResumeAppUITests
//
//  Created by Jair Moreno Gaspar on 5/2/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import XCTest

class WorkExperienceUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
    }
    
    override func tearDown() {}
    
}

extension WorkExperienceUITests {
    
    func testDetailWork(){
        
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().tabBars.buttons["Favorites"].tap()
        
        XCUIApplication().tabBars.buttons["Downloads"].tap()
        
        let tabBarsQuery = XCUIApplication().tabBars
        tabBarsQuery.buttons["Search"].tap()
        tabBarsQuery.buttons["Most Viewed"].tap()
                
        
//        let table = app.tables
//        //XCTAssert(table.cells.count == 4)
//        XCTAssert(true)
//        //app.collectionViews["Work Table"].staticTexts["iOS Developer"].tap()
        
        
        
    }
    
   
    
}
