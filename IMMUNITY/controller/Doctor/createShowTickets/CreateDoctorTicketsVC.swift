//
//  CreateDoctorTicketsVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/2/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class CreateDoctorTicketsVC: UIViewController {
    
    @IBOutlet weak var saturday:UIButton!
    @IBOutlet weak var sunday:UIButton!
    @IBOutlet weak var monday:UIButton!
    @IBOutlet weak var tuesday:UIButton!
    @IBOutlet weak var wednesday:UIButton!
    @IBOutlet weak var thursday:UIButton!
    @IBOutlet weak var friday:UIButton!
    @IBOutlet weak var BTNSaveOutlet:UIButton!
    @IBOutlet weak var BTNCancelOutlet:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradBTNS()
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        
        // Btn saturday
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = saturday.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        saturday.layer.insertSublayer(gradientLayer, at: 0)
        
        saturday.layer.cornerRadius = 10
        saturday.clipsToBounds = true
        
        // Btn sunday
        let gradientLayer2 = CAGradientLayer()
        
        gradientLayer2.frame = sunday.bounds
        
        gradientLayer2.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer2.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer2.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        sunday.layer.insertSublayer(gradientLayer2, at: 0)
        
        sunday.layer.cornerRadius = 10
        sunday.clipsToBounds = true
        
        // Btn monday
        let gradientLayer3 = CAGradientLayer()
        
        gradientLayer3.frame = monday.bounds
        
        gradientLayer3.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer3.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer3.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        monday.layer.insertSublayer(gradientLayer3, at: 0)
        
        monday.layer.cornerRadius = 10
        monday.clipsToBounds = true
        
        // Btn tuesday
        let gradientLayer4 = CAGradientLayer()
        
        gradientLayer4.frame = tuesday.bounds
        
        gradientLayer4.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer4.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer4.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        tuesday.layer.insertSublayer(gradientLayer4, at: 0)
        
        tuesday.layer.cornerRadius = 10
        tuesday.clipsToBounds = true
        
        // Btn wednesday
        let gradientLayer5 = CAGradientLayer()
        
        gradientLayer5.frame = wednesday.bounds
        
        gradientLayer5.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer5.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer5.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        wednesday.layer.insertSublayer(gradientLayer5, at: 0)
        
        wednesday.layer.cornerRadius = 10
        wednesday.clipsToBounds = true
        
        // BTN thursday
        let gradientLayer6 = CAGradientLayer()
        
        gradientLayer6.frame = thursday.bounds
        
        gradientLayer6.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer6.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer6.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        thursday.layer.insertSublayer(gradientLayer6, at: 0)
        
        thursday.layer.cornerRadius = 10
        thursday.clipsToBounds = true
        
        // Btn friday
        let gradientLayer7 = CAGradientLayer()
        
        gradientLayer7.frame = friday.bounds
        
        gradientLayer7.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer7.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer7.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        friday.layer.insertSublayer(gradientLayer7, at: 0)
        
        friday.layer.cornerRadius = 10
        friday.clipsToBounds = true
        
        // BTN Save Outlet
        BTNSaveOutlet.layer.cornerRadius = 10
        BTNSaveOutlet.clipsToBounds = true
        
        // BTN Save Outlet
        BTNCancelOutlet.layer.cornerRadius = 10
        BTNCancelOutlet.clipsToBounds = true
        
    }
    
}
