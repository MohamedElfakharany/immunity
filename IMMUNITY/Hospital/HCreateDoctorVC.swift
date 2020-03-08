//
//  CreateDoctorVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/3/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HCreateDoctorVC: UIViewController {
    
    @IBOutlet weak var specialityTextField: UITextField!
    @IBOutlet weak var doctorNameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var PasswordConfirmationTextField: UITextField!
    
    @IBOutlet weak var BtnOutletSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnOutletSave.layer.cornerRadius = 10
        BtnOutletSave.clipsToBounds = true
        
        BackgroundTF()
        
    }
    
    func BackgroundTF() {
        
        specialityTextField.MakeRoundeEdges(specialityTextField)
        specialityTextField.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        doctorNameTextField.MakeRoundeEdges(doctorNameTextField)
        doctorNameTextField.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        mobileNumberTextField.MakeRoundeEdges(mobileNumberTextField)
        mobileNumberTextField.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        emailTextField.MakeRoundeEdges(emailTextField)
        emailTextField.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        PasswordTextField.MakeRoundeEdges(PasswordTextField)
        PasswordTextField.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        PasswordConfirmationTextField.MakeRoundeEdges(PasswordConfirmationTextField)
        PasswordConfirmationTextField.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
    }
    
}
