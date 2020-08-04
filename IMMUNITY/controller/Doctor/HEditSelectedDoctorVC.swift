//
//  HEditSelectedDoctorVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 6/16/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class HEditSelectedDoctorVC: UIViewController , NVActivityIndicatorViewable {
    
    @IBOutlet weak var imageuser: UIImageView!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocEmail: UILabel!
    @IBOutlet weak var LblDocFees: UILabel!
    @IBOutlet weak var LblDocMobile: UILabel!
    @IBOutlet weak var BtnSaveOutlet: UIButton!
    
    var singelItem: SingleDoctor2?
    var doctor_id = 54
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doctor_id = singelItem?.id ?? 0
        
//        LblDocName.text = "DR. \(singelItem?.firstName ?? "") \(singelItem?.lastName ?? "")"
//        LblDocSpeciality.text = "\(singelItem?.specialities ?? "")"
//        LblDocFees.text = "Price :\(singelItem?.fees ?? "") LE"
//        LblDocEmail.text = "Email: \(singelItem?.email ?? "")"
//        LblDocMobile.text = "Mobile: \(singelItem?.mobileNumber ?? "")"
//        print("singelItem  \(singelItem!)")
//        print("doctor_id  \(doctor_id)")
//        let urlWithOutEncoding = "\(singelItem?.image ?? "")"
//        let encodedLink = urlWithOutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
//        let encodedURL = NSURL(string: encodedLink!)! as URL
//        DocImage.kf.indicatorType = .activity
//        DocImage.kf.setImage(with: encodedURL)
//        
        gradBTNS()
        
        LblDocName.roundedView()
        LblDocSpeciality.roundedView()
        LblDocEmail.roundedView()
        LblDocFees.roundedView()
        LblDocMobile.roundedView()
        
        imageuser.roundedImage()
        imageContainer.roundedView()
        
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
