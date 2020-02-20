//
//  TicketInformationVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/20/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class TicketInformationVC: UIViewController {
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    @IBOutlet weak var LblDocAppintmentDay: UILabel!
    @IBOutlet weak var LblDocAppintment: UILabel!
    @IBOutlet weak var TxtviewDocInfo: UITextView!
    @IBOutlet weak var BtnConfirmOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cell back view
        BackView.layer.cornerRadius = 20
        BackView.clipsToBounds = true
        BackView.layer.shadowRadius = 4
        BackView.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        BackView.layer.shadowOpacity = 1
        
        gradBTNS()
        
    }
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // First BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnConfirmOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnConfirmOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnConfirmOutlet.layer.cornerRadius = 10
        BtnConfirmOutlet.clipsToBounds = true
        
    }
    
    @IBAction func BtnConfirmAction(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookingConfirmationVC") as? BookingConfirmationVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
