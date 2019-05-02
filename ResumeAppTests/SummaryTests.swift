//
//  ResumeAppTests.swift
//  ResumeAppTests
//
//  Created by Jair Moreno Gaspar on 4/30/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import XCTest
@testable import ResumeApp




class SummaryTests: XCTestCase {
    
    let filledSummaryMockModel = Summary(name: "name", summary: SummaryDescription(description: "descript"), interests: InterestDescription(description: "interest"))
    let emptySummary: Summary = Summary()
    
    var summaryPresenter: SummaryPresenter!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        summaryPresenter = SummaryPresenter(summary: filledSummaryMockModel)
        
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        summaryPresenter.detachView()
        summaryPresenter = nil
        super.tearDown()
    }
    
    
    
    
    
    
}

extension SummaryTests {
    
    func testShouldSetSummary() {
        let expectation = self.expectation(description: "get summary correct")
        
        
        //given
        let summaryViewMock = SummaryViewMock(presenter: summaryPresenter)
        summaryViewMock.expectation = expectation
        summaryPresenter.attachView(summaryViewMock)
        
        //when
        summaryPresenter.getSummary()
        
        //verify
        wait(for: [expectation], timeout: 2)
    }
    
    func testShouldFailed(){
        
        let expectation = self.expectation(description: "should enter in setEmptySummary")
        summaryPresenter = SummaryPresenter(summary: emptySummary)
        //given
        let summaryViewMock = SummaryViewMockFailed(presenter: summaryPresenter)
        summaryViewMock.expectation = expectation
        summaryPresenter.attachView(summaryViewMock)
        
        //when
        summaryPresenter.getSummary()
        
        //verify
        wait(for: [expectation], timeout: 2)
    }
    
}
