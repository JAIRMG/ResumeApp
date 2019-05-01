//
//  Summary.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 4/30/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation

struct Summary: Decodable {
    var name: String?
    var summary: SummaryDescription?
    var interests: InterestDescription?
}

struct SummaryDescription: Decodable {
    var description: String?
}

struct InterestDescription: Decodable {
    var description: String?
}
