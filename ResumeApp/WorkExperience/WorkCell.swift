//
//  WorkCell.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class WorkCell: UITableViewCell {
    
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var companyImage: RoundableButton!
    
    
    
    
    var work: WorkInfo? {
        didSet {
            roleLabel.text = work?.role
            periodLabel.text = work?.date
            companyLabel.text = work?.company
            companyImage.downloadFrom(link: work?.image, contentMode: .scaleAspectFit)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    
}

