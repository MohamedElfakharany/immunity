//
//  DMoreVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/1/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class DMoreVC: UIViewController ,NVActivityIndicatorViewable{
    
    @IBOutlet weak var imageuser: UIImageView!
    @IBOutlet weak var imageContainer: UIView!
    
    @IBOutlet weak var ProfileView: UIView!
    
    @IBOutlet weak var ContactUsView: UIView!
    
    @IBOutlet weak var AboutUsView: UIView!
    
    @IBOutlet weak var BtnSignOutOutlet: UIButton!
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradBTNS()
        views()
        
        if Helper.getAccessToken().userToken == nil {
            self.ProfileView.isHidden = true
            self.BtnSignOutOutlet.setTitle("Sign In", for: UIControl.State.normal)
            NSLayoutConstraint.activate([stackView.heightAnchor.constraint(equalToConstant: 135)])
            self.reloadInputViews()
        }
        imageuser.roundedImage()
        imageContainer.roundedView()
        
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
    
    
    func views() {
        ProfileView.layer.cornerRadius = 10
        ProfileView.layer.shadowColor = UIColor.black.cgColor
        ProfileView.layer.shadowOffset = CGSize(width: 0.5, height: 0.4) //Here your control your spread
        ProfileView.layer.shadowOpacity = 0.5
        ProfileView.layer.shadowRadius = 5.0
        
        ContactUsView.layer.cornerRadius = 10
        ContactUsView.layer.shadowColor = UIColor.black.cgColor
        ContactUsView.layer.shadowOffset = CGSize(width: 0.5, height: 0.4) //Here your control your spread
        ContactUsView.layer.shadowOpacity = 0.5
        ContactUsView.layer.shadowRadius = 5.0
        
        AboutUsView.layer.cornerRadius = 10
        AboutUsView.layer.shadowColor = UIColor.black.cgColor
        AboutUsView.layer.shadowOffset = CGSize(width: 0.5, height: 0.4) //Here your control your spread
        AboutUsView.layer.shadowOpacity = 0.5
        AboutUsView.layer.shadowRadius = 5.0
        
    }
    
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnSignOutOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnSignOutOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnSignOutOutlet.layer.cornerRadius = 10
        BtnSignOutOutlet.clipsToBounds = true
    }//EndGrad
    
    @IBAction func BtnSignOutAction(_ sender: Any) {
        
        Helper.removePatientData()
        Helper.removeAccessToken()
        Helper.removeDocAccessToken()
    }

}

extension DMoreVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
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
