//
//  SearchVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/12/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var BtnSearchByAreaOutlet: UIButton!
    @IBOutlet weak var BtnSearchByDoctorNameOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        self.BtnSearchByAreaOutlet.center.y += 20
        self.BtnSearchByDoctorNameOutlet.center.y += 30
        
        gradBTNS()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        BtnSearchByAreaOutlet.alpha = 0.0
        BtnSearchByDoctorNameOutlet.alpha = 0.0
        self.BtnSearchByAreaOutlet.center.y += 20
        self.BtnSearchByDoctorNameOutlet.center.y += 30
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay : 0.0, options :[] ,  animations: {
        } ,completion : nil)
        
        UIView.animate( withDuration: 1, animations: {
            
            self.BtnSearchByAreaOutlet.alpha = 1.0
            self.BtnSearchByAreaOutlet.center.y -= 20
            self.BtnSearchByDoctorNameOutlet.alpha = 1.0
            self.BtnSearchByDoctorNameOutlet.center.y -= 30
            
        } ,completion : nil)
    }
    
func gradBTNS() {
    
    let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
    let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
    // First BTN
    let gradientLayer = CAGradientLayer()
    
    gradientLayer.frame = BtnSearchByAreaOutlet.bounds
    
    gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
    
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    
    BtnSearchByAreaOutlet.layer.insertSublayer(gradientLayer, at: 0)
    
    BtnSearchByAreaOutlet.layer.cornerRadius = 10
    BtnSearchByAreaOutlet.clipsToBounds = true
    
    // Second BTN
    let gradientLayer2 = CAGradientLayer()
    
    gradientLayer2.frame = BtnSearchByDoctorNameOutlet.bounds
    
    gradientLayer2.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
    
    gradientLayer2.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradientLayer2.endPoint = CGPoint(x: 1.0, y: 1.0)
    
    BtnSearchByDoctorNameOutlet.layer.insertSublayer(gradientLayer2, at: 0)
    
    BtnSearchByDoctorNameOutlet.layer.cornerRadius = 10
    BtnSearchByDoctorNameOutlet.clipsToBounds = true
}//EndGrad

@IBAction func BackBTN(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
}


    
}
