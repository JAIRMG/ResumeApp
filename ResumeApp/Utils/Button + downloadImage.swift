//
//  Button + downloadImage.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 5/2/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import UIKit

extension UIButton
{
    func downloadFrom(link:String?, contentMode mode: UIView.ContentMode)
    {
        contentMode = mode
       
        guard let url = URL(string: link ?? "") else {return}
        
            URLSession.shared.dataTask(with: url as URL, completionHandler: { (data, _, error) -> Void in
                guard let imageData = data else {
                    return
                }
                DispatchQueue.main.async {
                    if let image = UIImage(data: imageData) {
                        self.setBackgroundImage(image, for: .normal)
                    }
                    
                }
            }).resume()
        
        
    }
}
