//
//  ExperienceDetailController.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class ExperienceDetailController: UIViewController {
    
    @IBOutlet weak var detailWork: UILabel!
    @IBOutlet weak var Info: UILabel!
    
    
    var workDetail: WorkInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Info.text = workDetail?.detailWork
    }
    
}
