//
//  BookDoctorTableViewCell.swift
//  immunity22
//
//  Created by mayada on 2/21/20.
//  Copyright © 2020 mayada. All rights reserved.
//

import UIKit

class BookDoctorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var BtnOutletBookNow: UIButton!
    @IBOutlet weak var BackView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        BackView.dropShadow(scale: true)
        gradBTNS()
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnOutletBookNow.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletBookNow.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnOutletBookNow.layer.cornerRadius = 10
        BtnOutletBookNow.clipsToBounds = true
    }

    
    
}
