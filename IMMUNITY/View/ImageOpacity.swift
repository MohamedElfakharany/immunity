//
//  ImageOpacity.swift
//  IMMUNITY
//
//  Created by elfakharany on 12/4/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
