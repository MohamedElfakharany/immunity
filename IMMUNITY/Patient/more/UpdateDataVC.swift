//
//  UpdateDataVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/11/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class UpdateDataVC: UIViewController {
    
    var datePicker = UIDatePicker()
    var pickerView = UIPickerView()
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var TxtfieldFirstName: UITextField!
    @IBOutlet weak var TxtfieldLastName: UITextField!
    @IBOutlet weak var TxtfieldMobile: UITextField!
    @IBOutlet weak var TxtfieldCity: UITextField!
    @IBOutlet weak var TxtfieldEmail: UITextField!
    @IBOutlet weak var TxtfieldDateOfBirth: UITextField!
    
    @IBOutlet weak var SaveBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(SignUpVC.dateChanged(datePicker :)), for: .valueChanged)
        TxtfieldDateOfBirth.inputView = datePicker
        
        backgroundImage.alpha = 0.1
        gradBTNS()
        
    }

    @objc func dateChanged(datePicker : UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        TxtfieldDateOfBirth.text = dateFormatter.string(from: datePicker.date)
        //        view.endEditing(true)
    }
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = SaveBtnOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        SaveBtnOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        SaveBtnOutlet.layer.cornerRadius = 10
        SaveBtnOutlet.clipsToBounds = true
    }//EndGrad
    
    @IBAction func BtnActSave(_ sender: Any) {
        
        guard let FirstName = TxtfieldFirstName.text, !FirstName.isEmpty else {
            let messages = NSLocalizedString("enter your First Name", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let LastName = TxtfieldLastName.text, !LastName.isEmpty else {
            let messages = NSLocalizedString("enter your Last Name", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let Phone = TxtfieldMobile.text,!Phone.isEmpty else {
            let messages = NSLocalizedString("enter Your Mobile Number", comment: "please")
            let title = NSLocalizedString("Login Failed", comment: "please")
            self.showAlert(title: title, message: messages)
            
            return
        }
        
        guard let Email = TxtfieldEmail.text, !Email.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }

        guard let City = TxtfieldMobile.text,!City.isEmpty else {
            let messages = NSLocalizedString("enter Your Mobile Number", comment: "please")
            let title = NSLocalizedString("Login Failed", comment: "please")
            self.showAlert(title: title, message: messages)
            
            return
        }
        
        guard let DateOfBirth = TxtfieldDateOfBirth.text, !DateOfBirth.isEmpty else {
            let messages = NSLocalizedString("choose your Date Of Birth", comment: "hhhh")
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
