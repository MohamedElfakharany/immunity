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
        
    }
    
    var picker_imag: UIImage? {
        didSet{
            guard let image = picker_imag else {return}
            imageuser.isHidden = false
            self.imageuser.image = image
        }
    }
    
    @IBAction func selectImage(_ sender: Any) {
        
        let piker = UIImagePickerController()
        piker.allowsEditing = true
        piker.sourceType = .photoLibrary
        piker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Chose A Source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                piker.sourceType = .camera
                self.present(piker, animated: true, completion: nil)
            }else {
                print("notFound")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            piker.sourceType = .photoLibrary
            self.present(piker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        
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

extension HEditSelectedDoctorActionVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.picker_imag = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.picker_imag = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
