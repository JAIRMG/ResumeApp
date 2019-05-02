//
//  Skills.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/1/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation

struct Skills: Decodable {
    var basicKnowledge: BasickKnowledge?
    var advancedKnowledge: AdvancedKnowledge?
    
}

struct AdvancedKnowledge: Decodable {
    var advanced: [String]?
}

struct BasickKnowledge: Decodable {
    var basic: [String]?
}
