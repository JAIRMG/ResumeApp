//
//  Work.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation

struct Work: Decodable {
    var workInfo: [WorkInfo]?
}

struct WorkInfo: Decodable {
    var date: String?
    var role: String?
    var company: String?
    var detailWork: String?
    var image: String?
}

