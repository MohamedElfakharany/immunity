//
//  ResetPasswordVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 12/5/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var TxtFieldMobile: UITextField!
    @IBOutlet weak var SendBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        backgroundImage.alpha = 0.1
        gradBTNS()
        BackgroundTF()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)).cgColor
            ])
    }
    
    func BackgroundTF() {
        
        TxtFieldMobile.MakeRoundeEdges(TxtFieldMobile)
        TxtFieldMobile.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = SendBtnOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        SendBtnOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        SendBtnOutlet.layer.cornerRadius = 10
        //        SignInBtnOutlet.layer.cornerRadius = SignInBtnOutlet.frame.height/2
        SendBtnOutlet.clipsToBounds = true
    }//EndGrad
    
    @IBAction func BtnActSignin(_ sender: Any) {
        
        guard let mobiles = TxtFieldMobile.text, !mobiles.isEmpty else {
            let messages = NSLocalizedString("enter your Number", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
    }

    // keybord disappair
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }//EndDisappair
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
        
    }//EndShouldReturn
    
    
}
