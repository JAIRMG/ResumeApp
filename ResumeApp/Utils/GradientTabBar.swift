//
//  GradientTabBar.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 4/30/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {
    
    let layerGradient = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        layerGradient.colors = [UIColor(displayP3Red: 43/255, green: 30/255, blue: 83/255, alpha: 1).cgColor, UIColor(displayP3Red: 3/255, green: 144/255, blue: 197/255, alpha: 1).cgColor]
        layerGradient.startPoint = CGPoint(x: 0, y: 0.5)
        layerGradient.endPoint = CGPoint(x: 1, y: 0.5)
        layerGradient.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        
        self.layer.insertSublayer(layerGradient, at: 0)
        
    }
}
