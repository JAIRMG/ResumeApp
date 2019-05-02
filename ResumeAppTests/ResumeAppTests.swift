//
//  ResumeAppTests.swift
//  ResumeAppTests
//
//  Created by Jair Moreno Gaspar on 4/30/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import XCTest
@testable import ResumeApp

class SummaryServiceMock: SummaryPresenter {
    fileprivate var summary: Summary
    fileprivate var summaryView: SummaryViewMock?
    override init(summary: Summary) {
        self.summary = summary
        super.init(summary: summary)
    }
    
    func attachView(_ view: SummaryViewMock){
        summaryView = view
    }

    override func getSummary() {
        self.summaryView?.setSummary(self.summary)
    }
    
}


class SummaryViewMock : NSObject, SummaryView{
    
    var setSummaryCalled = false
    var setEmptySummaryCalled = false
    
    func setSummary(_ summary: Summary) {
        setSummaryCalled = true
    }
    
    func setEmptySummary() {
        setEmptySummaryCalled = true
    }
    
    func startLoading() {
    }
    
    func finishLoading() {
    }
    
}


class ResumeAppTests: XCTestCase {
    
    let emptySummaryModel = SummaryServiceMock(summary: Summary())
    //let filledSummaryModel = Summary(name: "name", summary: SummaryDescription(description: "descript"), interests: InterestDescription(description: "interest"))
    let filledSummaryModel = SummaryServiceMock(summary: Summary(name: "name", summary: SummaryDescription(description: "descript"), interests: InterestDescription(description: "interest")))

    func testShouldSetSummary() {
        //given
        let summaryViewMock = SummaryViewMock()
        let summaryPresenterUnderTest = SummaryPresenter(summary: Summary())
        summaryPresenterUnderTest.attachView(summaryViewMock)
        
        //when
        summaryPresenterUnderTest.getSummary()
        
        //verify
        XCTAssertTrue(summaryViewMock.setSummaryCalled)
    }
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


}
