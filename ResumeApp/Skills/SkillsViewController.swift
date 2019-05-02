//
//  SkillsViewController.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {
    
    
    @IBOutlet weak var advancedS: UILabel!
    @IBOutlet weak var advancedA: UILabel!
    
    @IBOutlet weak var b1: UILabel!
    @IBOutlet weak var b2: UILabel!
    @IBOutlet weak var b3: UILabel!
    @IBOutlet weak var b4: UILabel!
    @IBOutlet weak var b5: UILabel!
    @IBOutlet weak var bb6: UILabel!
    
    fileprivate let skillsPresenter = SkillsPresenter(skills: Skills())
    fileprivate var skills: Skills = Skills()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skillsPresenter.attachView(self)
        skillsPresenter.getSkills()
        
    }
    
}

extension SkillsViewController: SkillsView {
    func startLoading() {
        print("Loading")
    }
    
    func finishLoading() {
        print("Finishing")
    }
    
    func setSkills(_ skill: Skills) {
        self.skills = skill
        advancedS.text = self.skills.advancedKnowledge?.advanced?[0]
        advancedA.text = self.skills.advancedKnowledge?.advanced?[1]
        b1.text = self.skills.basicKnowledge?.basic?[0]
        b2.text = self.skills.basicKnowledge?.basic?[1]
        b3.text = self.skills.basicKnowledge?.basic?[2]
        b4.text = self.skills.basicKnowledge?.basic?[3]
        b5.text = self.skills.basicKnowledge?.basic?[4]
        bb6.text = self.skills.basicKnowledge?.basic?[5]
        
    }
    
    
    
    
}
