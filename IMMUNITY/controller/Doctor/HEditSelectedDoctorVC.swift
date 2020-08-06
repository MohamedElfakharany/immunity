//
//  HEditSelectedDoctorVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 6/16/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Kingfisher

class HEditSelectedDoctorVC: UIViewController , NVActivityIndicatorViewable {
    
    @IBOutlet weak var imageuser: UIImageView!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocEmail: UILabel!
    @IBOutlet weak var LblDocFees: UILabel!
    @IBOutlet weak var LblDocMobile: UILabel!
    @IBOutlet weak var BtnSaveOutlet: UIButton!
    
    var singelItem: DocProfile?
    var doctor_id = 54
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradBTNS()
        
        LblDocName.roundedView()
        LblDocSpeciality.roundedView()
        LblDocEmail.roundedView()
        LblDocFees.roundedView()
        LblDocMobile.roundedView()
        
        imageuser.roundedImage()
        imageContainer.roundedView()
        profileHandleRefresh()
    }
    
    func profileHandleRefresh() {
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",  type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        
        DoctorAPI.getDocProfile() { (error, networkSuccess, codeSuccess, docProfile) in
            if networkSuccess {
                if codeSuccess {
                    if let profile = docProfile{
                        print("profile comes here \(profile)")
                        self.singelItem = profile.result?.profile!
                        
                        self.LblDocName.text = "DR. \(self.singelItem?.firstName ?? "") \(self.singelItem?.lastName ?? "")"
                        self.LblDocSpeciality.text = "\(self.singelItem?.specialities ?? "")"
                        self.LblDocFees.text = "Price :\(self.singelItem?.fees ?? "") LE"
                        self.LblDocEmail.text = "Email: \(self.singelItem?.email ?? "")"
                        self.LblDocMobile.text = "Mobile: \(self.singelItem?.mobileNumber ?? "")"
//                        print("singelItem  \(self.singelItem!)")
                        let urlWithOutEncoding = "\(self.singelItem?.image ?? "")"
                        let encodedLink = urlWithOutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
                        let encodedURL = NSURL(string: encodedLink!)! as URL
                        self.imageuser.kf.indicatorType = .activity
                        self.imageuser.kf.setImage(with: encodedURL)
                        
                        
                        
                        self.stopAnimating()
                        
                    }else{
                        self.stopAnimating()
                        self.showAlert(title: "Error", message: "Error tickets")
                    }
                }else {
                    self.stopAnimating()
                    self.showAlert(title: "Doctor", message: "There is no tickets")
                }
            }else {
                self.stopAnimating()
                self.showAlert(title: "NetWork", message: "Check your network Connection")
            }
        }
        
    }
    
    
    func gradBTNS() {
        let RightGradientColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        // First BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnSaveOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnSaveOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnSaveOutlet.layer.cornerRadius = 10
        BtnSaveOutlet.clipsToBounds = true
    }
}
