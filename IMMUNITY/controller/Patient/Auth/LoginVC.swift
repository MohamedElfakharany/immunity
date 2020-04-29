//
//  LoginVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 11/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginVC: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var TxtFieldPassword: UITextField!
    @IBOutlet weak var TxtfieldEmail: UITextField!
    
    @IBOutlet weak var SignInBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradBTNS()
        BackgroundTF()
        
    }
    
    func BackgroundTF() {
        
        
        TxtfieldEmail.MakeRoundeEdges(TxtfieldEmail)
        TxtfieldEmail.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        
        TxtFieldPassword.MakeRoundeEdges(TxtFieldPassword)
        TxtFieldPassword.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = SignInBtnOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        SignInBtnOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        SignInBtnOutlet.layer.cornerRadius = 10
//        SignInBtnOutlet.layer.cornerRadius = SignInBtnOutlet.frame.height/2
        SignInBtnOutlet.clipsToBounds = true
    }//EndGrad
    
    @IBAction func BtnActSignin(_ sender: Any) {
        
        guard let email = TxtfieldEmail.text , !email.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
            
        }
        
        guard let password = TxtFieldPassword.text , !password.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
            
        }
        
        startAnimating(CGSize(width: 45, height: 45),message: "Loading",type: .ballSpinFadeLoader,color: .orange,textColor: .white)
        
        API_Auth.login(email: email, password: password) { (error: Error?, success: Bool) in
            if success {
                self.stopAnimating()
                print("login done")
            }
            else{
                self.stopAnimating()
                print("login failed")
                self.showAlert(title: "Network", message: "Check your network comnnection")
            }
        }
        
    }
    
    @IBAction func BtnBack(_ sender : Any){
        dismiss(animated: true, completion: nil)
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
