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
    
    var singelItem: GetDocProfile?
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
        data()
    }
    
    func data() {
        
        self.LblDocName.text = "DR. \(self.singelItem?.result?.profile?.firstName ?? "") \(self.singelItem?.result?.profile?.lastName ?? "")"
        self.LblDocSpeciality.text = "Speciality\(self.singelItem?.result?.profile?.specialities ?? "")"
        self.LblDocFees.text = "Price :\(self.singelItem?.result?.profile?.fees ?? "") LE"
        self.LblDocEmail.text = "Email: \(self.singelItem?.result?.profile?.email ?? "")"
        self.LblDocMobile.text = "Mobile: \(self.singelItem?.result?.profile?.mobileNumber ?? "")"
        //                        print("singelItem  \(self.singelItem!)")
        let urlWithOutEncoding = "\(self.singelItem?.result?.profile?.image ?? "")"
        let encodedLink = urlWithOutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        self.imageuser.kf.indicatorType = .activity
        self.imageuser.kf.setImage(with: encodedURL)
        
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
