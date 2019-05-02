//
//  ContactInfoViewController.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation
import UIKit

class ContactInfoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var contactInfoStack: UIStackView!
    
    
    fileprivate let contactInfoPresenter = ContactInfoPresenter(contactInfo: ContactInfo())
    fileprivate var contactInfo: ContactInfo = ContactInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactInfoPresenter.attachView(self)
        contactInfoPresenter.getContactInfo()
        
    }
    
}

extension ContactInfoViewController: ContactInfoView {
    func setEmptyContactInfo() {
        DispatchQueue.main.async {
            self.contactInfoStack.isHidden = true
        }
    }
    
    func startLoading() {
        CActivityIndicator.show()
    }
    
    func finishLoading() {
        CActivityIndicator.hide()
    }
    
    func setContactInfo(_ contactInfo: ContactInfo) {
        self.contactInfo = contactInfo
        self.contactInfoStack.isHidden = false
        nameLabel.text = self.contactInfo.fullName
        place.text = self.contactInfo.placeOfBirth
        date.text = self.contactInfo.dateOfBirth
        phone.text = ("\(self.contactInfo.phone ?? 00)")
        email.text = self.contactInfo.email
        
    }
    
    
}
