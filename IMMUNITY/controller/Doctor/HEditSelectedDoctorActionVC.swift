//
//  HEditSelectedDoctorActionVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 6/16/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HEditSelectedDoctorActionVC: UIViewController {
    
    @IBOutlet weak var imageuser: UIImageView!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var specialityTextField: UITextField!
    @IBOutlet weak var doctorNameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var FeesTextField: UITextField!
    
    @IBOutlet weak var BtnOutletSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnOutletSave.layer.cornerRadius = 10
        BtnOutletSave.clipsToBounds = true
        imageuser.roundedImage()
        BackgroundTF()
        
        imageuser.roundedImage()
        imageContainer.roundedView()
        
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
        
        FeesTextField.MakeRoundeEdges(FeesTextField)
        FeesTextField.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        
    }
    
}
