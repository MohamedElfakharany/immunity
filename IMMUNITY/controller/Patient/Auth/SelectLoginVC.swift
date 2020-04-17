//
//  SelectLoginVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 4/17/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SelectLoginVC: UIViewController {

    @IBOutlet weak var PatientSignin: UIButton!
    
    @IBOutlet weak var DoctorSignIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PatientSignin.center.y += 20
        self.DoctorSignIn.center.y += 30
        
        gradBTNS()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PatientSignin.alpha = 0.0
        DoctorSignIn.alpha = 0.0
        self.PatientSignin.center.y += 20
        self.DoctorSignIn.center.y += 30
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay : 0.0, options :[] ,  animations: {
            
        } ,completion : nil)
        
        UIView.animate( withDuration: 1, animations: {
            
            self.PatientSignin.alpha = 1.0
            self.PatientSignin.center.y -= 20
            self.DoctorSignIn.alpha = 1.0
            self.DoctorSignIn.center.y -= 30
            
        } ,completion : nil)
    }
    
    
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        
        // Patient Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = PatientSignin.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        PatientSignin.layer.insertSublayer(gradientLayer, at: 0)
        
        PatientSignin.layer.cornerRadius = 10
        PatientSignin.clipsToBounds = true
        
        // Doctor Sign In BTN
        let gradientLayer2 = CAGradientLayer()
        
        gradientLayer2.frame = DoctorSignIn.bounds
        
        gradientLayer2.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer2.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer2.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        DoctorSignIn.layer.insertSublayer(gradientLayer2, at: 0)
        
        DoctorSignIn.layer.cornerRadius = 10
        DoctorSignIn.clipsToBounds = true

    }
    
    @IBAction func BtnActionDoctorSignIn(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Doctor", bundle: nil).instantiateViewController(withIdentifier: "DSignInVC")as? DSignInVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
