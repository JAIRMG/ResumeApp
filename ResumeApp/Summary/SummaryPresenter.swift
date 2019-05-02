//
//  SummaryPresenter.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 4/30/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation

protocol SummaryView: class {
    func startLoading()
    func finishLoading()
    func setSummary(_ summary: Summary)
    func setEmptySummary()
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
        ApiService.sharedInstance.fetchForUrlString(urlString: "\(EndPoint.BaseURL.rawValue)\(Service.summary.rawValue)") {[weak self] (response: Result<Summary, Error>) in
            
            self?.summaryView?.finishLoading()
            
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let summary):
                strongSelf.summaryView?.setSummary(summary)
            case .failure(let error):
                print(error)
                strongSelf.summaryView?.setEmptySummary()
            }
        }
        
    }
    
}
