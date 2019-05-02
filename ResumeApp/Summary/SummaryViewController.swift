//
//  ViewController.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 4/30/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    
    @IBOutlet weak var summaryDescription: UILabel!
    @IBOutlet weak var interestDescription: UILabel!
    
    
    fileprivate let summaryPresenter = SummaryPresenter(summary: Summary())
    fileprivate var summary: Summary = Summary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        summaryPresenter.attachView(self)
        summaryPresenter.getSummary()
        
    }
    
}

extension SummaryViewController: SummaryView {
    func startLoading() {
        CActivityIndicator.show()
    }
    
    func finishLoading() {
        CActivityIndicator.hide()
    }
    
    func setSummary(_ summary: Summary) {
        self.summary = summary
        summaryDescription.isHidden = false
        interestDescription.isHidden = false
        summaryDescription.text = self.summary.summary?.description
        interestDescription.text = self.summary.interests?.description
    }
    
    func setEmptySummary(){
        DispatchQueue.main.async {
            self.summaryDescription.isHidden = true
            self.interestDescription.isHidden = true
        }
        
    }
    
    
}
