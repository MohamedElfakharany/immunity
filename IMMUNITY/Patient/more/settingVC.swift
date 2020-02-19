//
//  settingVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/11/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class settingVC: UIViewController {
    
    @IBOutlet weak var imageBG: UIImageView!
    
    @IBOutlet weak var BtnUpdateDataOutlet: UIButton!
    @IBOutlet weak var BtnChangePasswordOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageBG.alpha = 0.2
        gradBTNS()
        
    }
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // First BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnUpdateDataOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnUpdateDataOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnUpdateDataOutlet.layer.cornerRadius = 10
        BtnUpdateDataOutlet.clipsToBounds = true
        
        // Second BTN
        let gradientLayer2 = CAGradientLayer()
        
        gradientLayer2.frame = BtnChangePasswordOutlet.bounds
        
        gradientLayer2.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer2.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer2.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnChangePasswordOutlet.layer.insertSublayer(gradientLayer2, at: 0)
        
        BtnChangePasswordOutlet.layer.cornerRadius = 10
        BtnChangePasswordOutlet.clipsToBounds = true
    }//EndGrad
    
    @IBAction func BackBTN(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
