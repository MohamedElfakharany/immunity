//
//  MyAppointmentVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/20/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class MyAppointmentVC: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var image:UIImageView!
    @IBOutlet weak var BtnSignInOutlet:UIButton!
    
    var ticketDone = [SingleTicket]()
    var ticketCanCanceled = [SingleTicket]()
    var ticketCanceled = [SingleTicket]()
    
    let patient_id = Helper.getPatientId()
    let AvailabilityYes = ""
    
    let cellSpacingHeight: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Helper.getAccessToken() == nil {
            self.tableView.isHidden = true
            self.image.isHidden = false
            self.BtnSignInOutlet.isHidden = false
        }else {
            self.tableView.isHidden = false
            self.image.isHidden = true
            self.BtnSignInOutlet.isHidden = true
        }
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        gradBTNS()
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnSignInOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnSignInOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnSignInOutlet.layer.cornerRadius = 10
        BtnSignInOutlet.clipsToBounds = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: UITableViewCell =  tableView.dequeueReusableCell(withIdentifier: "MyAppointmentVCTableViewCell") as! MyAppointmentVCTableViewCell
            //set the data here
            return cell
        }
        else if indexPath.row == 1 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentWantCancledVCTableViewCell")as! MyAppointmentWantCancledVCTableViewCell
            //set the data here
            return cell
        }
        else {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentDidCanceledVCTableViewCell")as! MyAppointmentDidCanceledVCTableViewCell
            //set the data here
            return cell
        }
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    @IBAction func BtnSignInAction (_ sender:Any){
        Helper.removeAccessToken()
    }
    
}
