//
//  WorkExperiencePresenter.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation
import UIKit

protocol WorkExperienceView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setWork(_ work: [WorkInfo])
}

class WorkExperiencePresenter {
    fileprivate let workArray: Work
    weak fileprivate var workView: WorkExperienceView?
    
    init(workArray: Work) {
        self.workArray = workArray
    }
    
    func attachView(_ view: WorkExperienceView){
        workView = view
    }
    
    func detachView(){
        workView = nil
    }
    
    func getWork(){
        self.workView?.startLoading()
        ApiService.sharedInstance.fetchForUrlString(urlString: "https://raw.githubusercontent.com/JAIRMG/OriginTest/master/OriginTest/work.json") {[weak self] (response: Result<Work, Error>) in
            
            self?.workView?.finishLoading()
            
            switch response {
            case .success(let work):
                print(work)
                self?.workView?.setWork(work.workInfo ?? [])
            case .failure(let error):
                print(error)
                
            }
        }
    }

    
}
