//
//  SummaryPresenter.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 4/30/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation

protocol SummaryView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setSummary(_ summary: Summary)
}

class SummaryPresenter {
    fileprivate let summary: Summary
    weak fileprivate var summaryView: SummaryView?
    
    init(summary: Summary) {
        self.summary = summary
    }
    
    func attachView(_ view: SummaryView){
        summaryView = view
    }
    
    func detachView(){
        summaryView = nil
    }
    
    func getSummary(){
        self.summaryView?.startLoading()
        ApiService.sharedInstance.fetchForUrlString(urlString: "https://raw.githubusercontent.com/JAIRMG/OriginTest/master/OriginTest/summary.json") {[weak self] (response: Result<Summary, Error>) in
            
            self?.summaryView?.finishLoading()
            
            switch response {
            case .success(let summary):
                print(summary)
                self?.summaryView?.setSummary(summary)
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
}
