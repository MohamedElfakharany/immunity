//
//  moreVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 1/30/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class moreVC: UIViewController {
    
    @IBOutlet weak var imageBG: UIImageView!
    
    @IBOutlet weak var SettingView: UIView!
    
    @IBOutlet weak var ApprovalListView: UIView!
    
    @IBOutlet weak var ContactUsView: UIView!
    
    @IBOutlet weak var AboutUsView: UIView!
    
    @IBOutlet weak var BtnSignOutOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradBTNS()
        views()
 
    }
    
    func views() {
        SettingView.layer.cornerRadius = 10
        SettingView.layer.shadowColor = UIColor.black.cgColor
        SettingView.layer.shadowOffset = CGSize(width: 0.5, height: 0.4) //Here your control your spread
        SettingView.layer.shadowOpacity = 0.5
        SettingView.layer.shadowRadius = 5.0
        
        ApprovalListView.layer.cornerRadius = 10
        ApprovalListView.layer.shadowColor = UIColor.black.cgColor
        ApprovalListView.layer.shadowOffset = CGSize(width: 0.5, height: 0.4) //Here your control your spread
        ApprovalListView.layer.shadowOpacity = 0.5
        ApprovalListView.layer.shadowRadius = 5.0
        
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
        Helper.removeAccessToken()
        
    }
    @IBAction func BtnApprovalListAction(_ sender: Any) {
    
    }
    
    
    
}
