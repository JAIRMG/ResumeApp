//
//  WorkExperienceViewController.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class WorkExperienceViewController: UIViewController {
    
    @IBOutlet weak var workTable: UITableView!
    
    fileprivate let workPresenter = WorkExperiencePresenter(workArray: Work())
    fileprivate var work = [WorkInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workPresenter.attachView(self)
        workPresenter.getWork()
        
        
    }
    
}

extension WorkExperienceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return work.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = workTable.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as! WorkCell
        cell.work = self.work[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self.work[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ExperienceDetailController {
            vc.workDetail = sender as! WorkInfo
        }
    }
    
}

extension WorkExperienceViewController: WorkExperienceView {
    func startLoading() {
        print("")
    }
    
    func finishLoading() {
        print("")
    }
    
    func setWork(_ work: [WorkInfo]) {
        self.work = work
        self.workTable.reloadData()
    }
   
    
    
}
