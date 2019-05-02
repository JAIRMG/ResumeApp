//
//  ContactInfoPresenter.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation

protocol ContactInfoView: class {
    func startLoading()
    func finishLoading()
    func setContactInfo(_ contactInfo: ContactInfo)
    func setEmptyContactInfo()
}

class ContactInfoPresenter {
    
    fileprivate let contactInfo: ContactInfo
    weak fileprivate var contactInfoView: ContactInfoView?
    
    init(contactInfo: ContactInfo) {
        self.contactInfo = contactInfo
    }
    
    func attachView(_ view: ContactInfoView){
        contactInfoView = view
    }
    
    func detachView(){
        contactInfoView = nil
    }
    
    func getContactInfo(){
        self.contactInfoView?.startLoading()
        ApiService.sharedInstance.fetchForUrlString(urlString: "\(EndPoint.BaseURL.rawValue)\(Service.contacInfo.rawValue)") {[weak self] (response: Result<ContactInfo, Error>) in
            
            self?.contactInfoView?.finishLoading()
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let contactInfo):
                strongSelf.contactInfoView?.setContactInfo(contactInfo)
            case .failure(let error):
                print(error)
                strongSelf.contactInfoView?.setEmptyContactInfo()
                
            }
        }
        
    }
    
    
}
