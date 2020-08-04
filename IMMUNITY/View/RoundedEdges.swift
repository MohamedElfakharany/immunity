//
//  RoundedEdges.swift
//  IMMUNITY
//
//  Created by elfakharany on 11/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class RoundedEdges: UIView {
    
}
extension UIView {
    func MakeRoundeEdges(_ View : UIView){
        
        View.layer.cornerRadius = 10
//        View.layer.cornerRadius = View.frame.height/2
        View.clipsToBounds = true
    }
    
    
}
extension UITextField {
    
    func addShadowToTextField(color: UIColor = UIColor.lightGray, cornerRadius: CGFloat) {
        
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 1 , height: 1)
        self.layer.shadowOpacity = 0.1
        self.backgroundColor = .white
        
    }
}


extension CGRect{
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) {
        self.init(x:x,y:y,width:width,height:height)
    }
    
}

extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.height / 2
        //        imageView.layer.masksToBounds = true
        //        imageView.layer.borderWidth = 1.5
        //        imageView.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
    }
    
}

extension UIView {
    
    func roundedView() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.4) //Here your control your spread
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5.0
    }
    
}


