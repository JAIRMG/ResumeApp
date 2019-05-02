//
//  EndPoint.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/2/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation

enum EndPoint: String {
    case BaseURL = "https://raw.githubusercontent.com/JAIRMG/OriginTest/master/OriginTest/"
}

enum Service: String {
    case summary = "summary.json"
    case skills = "skills.json"
    case work = "work.json"
    case contacInfo = "contactInfo.json"
}

