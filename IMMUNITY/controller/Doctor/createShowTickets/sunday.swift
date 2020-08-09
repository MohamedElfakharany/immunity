//
//  sunday.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/2/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class sunday: UIViewController , NVActivityIndicatorViewable {
    
    @IBOutlet weak var FromTxtField: UITextField!
    @IBOutlet weak var ToTxtField: UITextField!
    
    let day = 2
    
    @IBOutlet weak var BTNOutletSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackgroundTF()
        gradBTNS()
        
    }
    
    func BackgroundTF() {
        
        
        FromTxtField.MakeRoundeEdges(FromTxtField)
        FromTxtField.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        
        ToTxtField.MakeRoundeEdges(ToTxtField)
        ToTxtField.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BTNOutletSave.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BTNOutletSave.layer.insertSublayer(gradientLayer, at: 0)
        
        BTNOutletSave.layer.cornerRadius = 10
        //        SignInBtnOutlet.layer.cornerRadius = SignInBtnOutlet.frame.height/2
        BTNOutletSave.clipsToBounds = true
    }//EndGrad
    
    @IBAction func BTNActionSave(_ sender: Any) {
        
        guard let FromTxt = FromTxtField.text , !FromTxt.isEmpty else {
            let messages = NSLocalizedString("enter your Start", comment: "hhhh")
            let title = NSLocalizedString("Addition Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
            
        }
        
        guard let ToTxt = ToTxtField.text , !ToTxt.isEmpty else {
            let messages = NSLocalizedString("enter your End", comment: "hhhh")
            let title = NSLocalizedString("Addition Failed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
            
        }
        
        startAnimating(CGSize(width: 45, height: 45),message: "Loading",type: .ballSpinFadeLoader,color: .orange,textColor: .white)
        
        TicketsApi.AddTickets(dayID: self.day, from: FromTxtField.text ?? "", to: ToTxtField.text ?? "") { (error, networkSuccess, codeSuccess, message)
            in
            
            if networkSuccess {
                if codeSuccess {
                    if let message = message{
                        if message.errorFlag == 0  {
                            self.stopAnimating()
                            self.showAlert(title: "Addition Succesed", message: "add Another Ticket")
                        }else {
                            self.stopAnimating()
                            self.showAlert(title: "Book Failed", message: message.message ?? "")
                        }
                        
                        
                    }else{
                        self.stopAnimating()
                        self.showAlert(title: "NetWork", message: "Check your network Connection!")
                    }
                }else {
                    self.stopAnimating()
                    self.showAlert(title: "NetWork", message: "Check your network Connection!!")
                }
            }else {
                self.stopAnimating()
                self.showAlert(title: "NetWork", message: "Check your network Connection!!!")
            }
        }
    }
    
    
}
