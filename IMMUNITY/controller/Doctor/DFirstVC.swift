//
//  DFirstVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/29/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class DFirstVC: UIViewController {
    
    @IBOutlet weak var BtnAppointmentOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.BtnAppointmentOutlet.center.y += 20
        
        gradBTNS()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        BtnAppointmentOutlet.alpha = 0.0
        self.BtnAppointmentOutlet.center.y += 20
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {}, completion: nil)
        UIView.animate(withDuration: 1, animations: {
         self.BtnAppointmentOutlet.alpha = 1.0
            self.BtnAppointmentOutlet.center.y -= 20
        }, completion: nil)
    }
    
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnAppointmentOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnAppointmentOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnAppointmentOutlet.layer.cornerRadius = 10
        BtnAppointmentOutlet.clipsToBounds = true
        
    }
    
    
}
