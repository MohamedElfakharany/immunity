//
//  AppointmentDetailsVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/24/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class AppointmentDetailsVC: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var BtnConfirmOutlet: UIButton!
    @IBOutlet weak var BtnRejectOutlet: UIButton!
    
    @IBOutlet weak var LblDetectionNumber : UILabel!
    @IBOutlet weak var LblDoctorCode : UILabel!
    @IBOutlet weak var LblPatientCode : UILabel!
    @IBOutlet weak var LblTicketDay : UILabel!
    @IBOutlet weak var LblTicketTime : UILabel!
    @IBOutlet weak var LblDoctorName : UILabel!
    
    @IBOutlet weak var MedicalReportTxtView: UITextView!

    var singleItem : SingleBook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(singleItem ?? [SingleTicket2]())
        
//        LblDetectionNumber.text = "\(singleItem?.id ?? 0)"
//        LblDoctorCode.text = "\(singleItem?.docID ?? "")"
//        LblPatientCode.text = "\(singleItem?.patientID ?? "")"
        LblTicketDay.text = "\(singleItem?.day ?? "")"
//        LblTicketTime.text = "\(singleItem?.time ?? "") , \(singleItem?.duration ?? "")"
//        LblDoctorName.text = "\(singleItem?.docName ?? "")"
//        MedicalReportTxtView.text = "\(singleItem?.medicalReport ?? "")"
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.dropShadow(scale: true)
        BtnRejectOutlet.layer.cornerRadius = 10
        BtnRejectOutlet.clipsToBounds = true
        
        gradBTNS()
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnConfirmOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnConfirmOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnConfirmOutlet.layer.cornerRadius = 10
        BtnConfirmOutlet.clipsToBounds = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentDetailsTableViewCell", for: indexPath)
        return cell
    }
    

}
