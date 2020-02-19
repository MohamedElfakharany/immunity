//
//  ChangePasswordVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/11/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var TxtfieldPassword: UITextField!
    @IBOutlet weak var TxtFieldPasswordConfirmation: UITextField!
    @IBOutlet weak var SendBtnOutlet: UIButton!
    
    var iconClick : Bool!
    var iconClick2 : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        backgroundImage.alpha = 0.1
        
        gradBTNS()
        
        
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
        SendBtnOutlet.clipsToBounds = true
    }//EndGrad
    @IBAction func showHideAction(_ sender: Any) {
        
        _ = TxtfieldPassword.text!;
        
        if(iconClick == true) {
            TxtfieldPassword.isSecureTextEntry = false
            iconClick = false
        } else {
            TxtfieldPassword.isSecureTextEntry = true
            //  iconClick = true
            iconClick = true
        }
    }
    
    @IBAction func BtnActSend(_ sender: Any){
        
    guard let Password = TxtfieldPassword.text, !Password.isEmpty else {
    let messages = NSLocalizedString("enter your password", comment: "hhhh")
    let title = NSLocalizedString("Login Failed", comment: "hhhh")
    self.showAlert(title: title, message: messages)
    return
    }
    
    guard let PasswordConfirmation = TxtFieldPasswordConfirmation.text, !PasswordConfirmation.isEmpty else {
    let messages = NSLocalizedString("enter your password Confirmation", comment: "hhhh")
    let title = NSLocalizedString("Login Failed", comment: "hhhh")
    self.showAlert(title: title, message: messages)
    return
        }
        
        API_UpdatePatientData.UpdatePatientPassword(password: Password) { (error: Error?, success: Bool) in
            if success {
                print("Update Patient Password Done")
            }else
            {
                print("Update Patient Password")
            }
        }
        
    }
    
    
    @IBAction func showHideAction2(_ sender: Any) {
        
        _ = TxtFieldPasswordConfirmation.text!;
        
        if(iconClick2 == true) {
            TxtFieldPasswordConfirmation.isSecureTextEntry = false
            iconClick2 = false
        } else {
            TxtFieldPasswordConfirmation.isSecureTextEntry = true
            iconClick2 = true
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
