//
//  MyAppointmentVCTableViewCell.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/21/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class MyAppointmentVCTableViewCell: UITableViewCell {

    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var BtnDetectedOutlet: UIButton!
    @IBOutlet weak var BtnDetailsOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        selectionStyle = .none
        
        BtnDetectedOutlet.layer.cornerRadius = 10
        BtnDetectedOutlet.clipsToBounds = true
        
        BackView.dropShadow(scale: true)
        backgroundView?.dropShadow(scale: true)
        gradBTNS()
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnDetectedOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnDetectedOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnDetectedOutlet.layer.cornerRadius = 10
        BtnDetectedOutlet.clipsToBounds = true
        
     }
    
    
    @IBAction func BtnBookNowAction (_ sender : Any) {
        if let vc = UIStoryboard.init().instantiateViewController(withIdentifier: "AppointmentDetailsVC") as? AppointmentDetailsVC {
            self.inputViewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
