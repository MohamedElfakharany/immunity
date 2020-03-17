//
//  BookingConfirmationVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/20/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class BookingConfirmationVC: UIViewController {
    
    @IBOutlet weak var BtnMyAppointmentOutlet:UIButton!
    @IBOutlet weak var LblDocName: UILabel!
    
    var window: UIWindow?
    var Name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.LblDocName.text = Name
        
        self.navigationController?.title = ""
        gradBTNS()
        
    }
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // First BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnMyAppointmentOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnMyAppointmentOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnMyAppointmentOutlet.layer.cornerRadius = 10
        BtnMyAppointmentOutlet.clipsToBounds = true
        
    }
    
    @IBAction func BtnMyAppointmentAction (_ sender : Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVCs") as? TabBarVCs {
            vc.selectedIndex = 2
            self.present(vc, animated: true, completion: nil)
        }
    }
}
