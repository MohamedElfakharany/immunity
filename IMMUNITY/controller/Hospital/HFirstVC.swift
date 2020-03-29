//
//  HFirstVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/3/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HFirstVC: UIViewController {
    
    @IBOutlet weak var BtnOutletHospitalClinicDefinition:UIButton!
    @IBOutlet weak var BtnOutletCreateDoctor:UIButton!
    @IBOutlet weak var BtnOutletEditDeleteDoctor:UIButton!
    @IBOutlet weak var BtnOutletDefineWorkingTimes:UIButton!
    @IBOutlet weak var BtnOutletViewEditDefineWorkingTimes:UIButton!
    @IBOutlet weak var BtnOutletSignOut:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradBTNS()
        
        BtnOutletSignOut.layer.cornerRadius = 10
        BtnOutletSignOut.clipsToBounds = true
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        
        // Btn Hospital Clinic Definition
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnOutletHospitalClinicDefinition.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletHospitalClinicDefinition.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnOutletHospitalClinicDefinition.layer.cornerRadius = 10
        BtnOutletHospitalClinicDefinition.clipsToBounds = true
        
        // Btn Hospital Clinic Definition
        let gradientLayer2 = CAGradientLayer()
        
        gradientLayer2.frame = BtnOutletCreateDoctor.bounds
        
        gradientLayer2.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer2.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer2.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletCreateDoctor.layer.insertSublayer(gradientLayer2, at: 0)
        
        BtnOutletCreateDoctor.layer.cornerRadius = 10
        BtnOutletCreateDoctor.clipsToBounds = true
        
        // Btn Hospital Clinic Definition
        let gradientLayer3 = CAGradientLayer()
        
        gradientLayer3.frame = BtnOutletEditDeleteDoctor.bounds
        
        gradientLayer3.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer3.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer3.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletEditDeleteDoctor.layer.insertSublayer(gradientLayer3, at: 0)
        
        BtnOutletEditDeleteDoctor.layer.cornerRadius = 10
        BtnOutletEditDeleteDoctor.clipsToBounds = true
        
        // Btn Hospital Clinic Definition
        let gradientLayer4 = CAGradientLayer()
        
        gradientLayer4.frame = BtnOutletDefineWorkingTimes.bounds
        
        gradientLayer4.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer4.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer4.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletDefineWorkingTimes.layer.insertSublayer(gradientLayer4, at: 0)
        
        BtnOutletDefineWorkingTimes.layer.cornerRadius = 10
        BtnOutletDefineWorkingTimes.clipsToBounds = true
        
        // Btn Hospital Clinic Definition
        let gradientLayer5 = CAGradientLayer()
        
        gradientLayer5.frame = BtnOutletViewEditDefineWorkingTimes.bounds
        
        gradientLayer5.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer5.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer5.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletViewEditDefineWorkingTimes.layer.insertSublayer(gradientLayer5, at: 0)
        
        BtnOutletViewEditDefineWorkingTimes.layer.cornerRadius = 10
        BtnOutletViewEditDefineWorkingTimes.clipsToBounds = true
    }
    
    @IBAction func BtnActionSignOut (_ sender :Any){
        
    }
    
}
