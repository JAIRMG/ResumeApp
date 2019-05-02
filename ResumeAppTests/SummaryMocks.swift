//
//  SummaryMocks.swift
//  ResumeAppTests
//
//  Created by Jair Moreno Gaspar on 5/2/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import XCTest
@testable import ResumeApp

class SummaryViewMock : NSObject, SummaryView{
    
    var presenter: SummaryPresenter!
    var expectation: XCTestExpectation!
    
    
    init(presenter: SummaryPresenter) {
        self.presenter = presenter
    }
    
    func setSummary(_ summary: Summary) {
        expectation.fulfill()
        
    }
    
    func setEmptySummary() {
        XCTFail()
    }
    
    func startLoading() {}
    
    func finishLoading() {}
    
}

class SummaryViewMockFailed : NSObject, SummaryView{
    
    var presenter: SummaryPresenter!
    var expectation: XCTestExpectation!
    
    
    init(presenter: SummaryPresenter) {
        self.presenter = presenter
    }
    
    func setSummary(_ summary: Summary) {
        setEmptySummary()
    }
    
    func setEmptySummary() {
        expectation.fulfill()
    }
    
    func startLoading() {}
    
    func finishLoading() {}
    
}
