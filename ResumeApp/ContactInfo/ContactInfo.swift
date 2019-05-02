//
//  ContactInfo.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation


struct ContactInfo: Decodable {
    var fullName: String?
    var placeOfBirth: String?
    var dateOfBirth: String?
    var phone: Int?
    var email: String?
}
