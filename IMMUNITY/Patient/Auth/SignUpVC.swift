//
//  SignUpVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 11/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class SignUpVC: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource {
    
    var datePicker = UIDatePicker()
    var pickerView = UIPickerView()
    var genders = ["Male","Female"]
    var iconClick : Bool!
    var iconClick2 : Bool!
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var TxtfieldFirstName: UITextField!
    @IBOutlet weak var TxtfieldLastName: UITextField!
    @IBOutlet weak var TxtfieldMobile: UITextField!
    @IBOutlet weak var TxtfieldCity: UITextField!
    @IBOutlet weak var TxtfieldEmail: UITextField!
    @IBOutlet weak var TxtfieldPassword: UITextField!
    @IBOutlet weak var TxtFieldPasswordConfirmation: UITextField!
    @IBOutlet weak var TxtfieldDateOfBirth: UITextField!
    @IBOutlet weak var TxtfieldGender: UITextField!
    
    @IBOutlet weak var SignInBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource  = self
        
        TxtfieldGender.inputView = pickerView
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(SignUpVC.dateChanged(datePicker :)), for: .valueChanged)
        TxtfieldDateOfBirth.inputView = datePicker
        
        backgroundImage.alpha = 0.1
        gradBTNS()
        BackgroundTF()

        iconClick = true
        iconClick2 = true
        
    }
    
    @objc func dateChanged(datePicker : UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        TxtfieldDateOfBirth.text = dateFormatter.string(from: datePicker.date)
//        view.endEditing(true)
    }
    
    
    // Picker Views
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            TxtfieldGender.text = genders[row]
            self.view.endEditing(true)
    }
    
    func BackgroundTF() {
        
        if let myImage = UIImage(named: "user"){
        TxtfieldFirstName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        TxtfieldFirstName.MakeRoundeEdges(TxtfieldFirstName)
        TxtfieldFirstName.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        }

        TxtfieldCity.MakeRoundeEdges(TxtfieldCity)
        TxtfieldCity.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        if let myImage = UIImage(named: "user"){
        TxtfieldLastName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        TxtfieldLastName.MakeRoundeEdges(TxtfieldLastName)
        TxtfieldLastName.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        }
        
        if let myImage = UIImage(named: "phone-call"){
        TxtfieldMobile.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        TxtfieldMobile.MakeRoundeEdges(TxtfieldMobile)
        TxtfieldMobile.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "email"){
        TxtfieldEmail.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        TxtfieldEmail.MakeRoundeEdges(TxtfieldEmail)
        TxtfieldEmail.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "password"){
        TxtfieldPassword.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        TxtfieldPassword.MakeRoundeEdges(TxtfieldPassword)
        TxtfieldPassword.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        
        if let myImage = UIImage(named: "password"){
        TxtFieldPasswordConfirmation.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        TxtFieldPasswordConfirmation.MakeRoundeEdges(TxtFieldPasswordConfirmation)
        TxtFieldPasswordConfirmation.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        
        if let myImage = UIImage(named: "calendar"){
        TxtfieldDateOfBirth.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        TxtfieldDateOfBirth.MakeRoundeEdges(TxtfieldDateOfBirth)
        TxtfieldDateOfBirth.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }

        if let myImage = UIImage(named: "gray-downarrow"){
            TxtfieldGender.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtfieldGender.MakeRoundeEdges(TxtfieldGender)
            TxtfieldGender.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "gray-downarrow"){
        TxtfieldDateOfBirth.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        TxtfieldDateOfBirth.MakeRoundeEdges(TxtfieldDateOfBirth)
        TxtfieldDateOfBirth.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
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
        SignInBtnOutlet.clipsToBounds = true
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
    
    @IBAction func BtnActSignin(_ sender: Any) {
        
        guard let FirstName = TxtfieldFirstName.text, !FirstName.isEmpty else {
            let messages = NSLocalizedString("enter your First Name", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let LastName = TxtfieldLastName.text, !LastName.isEmpty else {
            let messages = NSLocalizedString("enter your First Name", comment: "hhhh")
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
        
        guard let password = TxtfieldPassword.text, !password.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwordConfirmation = TxtFieldPasswordConfirmation.text, !passwordConfirmation.isEmpty else {
            let messages = NSLocalizedString("enter your password Confirmation", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard  password == passwordConfirmation else {
            let messages = NSLocalizedString("Password and password confirmation are different", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
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
        
        guard let Gender = TxtfieldGender.text, !Gender.isEmpty else {
            let messages = NSLocalizedString("choose your Gender", comment: "hhhh")
            let title = NSLocalizedString("Login Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
 
        
        API_Auth.register(first_name: FirstName, last_name: LastName, email: Email, password: password, phone: Phone, city: City) { (error :Error?, success :Bool) in
            if success {
                print("Register Done")
            }
            else{
                print("register failed")
            }
        }
        
        
        
        
    }
    

    @IBAction func BtnBack (_ sender : Any){
        dismiss(animated: true, completion:     nil)
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
