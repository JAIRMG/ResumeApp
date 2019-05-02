//
//  SkillsPresenter.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation

protocol SkillsView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setSkills(_ skill: Skills)
}

class SkillsPresenter {
    
    fileprivate let skills: Skills
    weak fileprivate var skillsView: SkillsView?
    
    init(skills: Skills) {
        self.skills = skills
    }
    
    func attachView(_ view: SkillsView){
        skillsView = view
    }
    
    func detachView(){
        skillsView = nil
    }
    
    
    func getSkills(){
        self.skillsView?.startLoading()
        ApiService.sharedInstance.fetchForUrlString(urlString: "https://raw.githubusercontent.com/JAIRMG/OriginTest/master/OriginTest/skills.json") {[weak self] (response: Result<Skills, Error>) in
            
            self?.skillsView?.finishLoading()
            
            switch response {
            case .success(let skills):
                print(skills)
                self?.skillsView?.setSkills(skills)
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    
}
