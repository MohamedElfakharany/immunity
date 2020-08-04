//
//  MyAppointmentVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/20/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MyAppointmentVC: UIViewController, UITableViewDelegate , UITableViewDataSource , NVActivityIndicatorViewable {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var image:UIImageView!
    @IBOutlet weak var BtnSignInOutlet:UIButton!
    
    var ticketArray = [SingleTicket2]()
    var selectedTicket : SingleTicket2?
    
    let patient_id = Helper.getPatientId()
    let AvailabilityYes = ""
    
    let cellSpacingHeight: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Helper.getAccessToken().userToken == nil {
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
        ticketsHandleRefresh()
        gradBTNS()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        ticketsHandleRefresh()
    }
    
    func ticketsHandleRefresh() {
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",  type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        
        TicketsApi.allTicketsByPatientId(Patient_Id: "\(patient_id ?? "")", availability: "NO") { (error, networkSuccess, codeSuccess, ticketArray) in
            if networkSuccess {
                if codeSuccess {
                    if let tickets = ticketArray{
                        self.ticketArray = tickets.result?.tickets ?? []
                        print(tickets)
                        print("patient_id : \(self.patient_id ?? " ")")
                        self.tableView.reloadData()
                        self.stopAnimating()
                    }else{
                        self.stopAnimating()
                        self.showAlert(title: "Error", message: "Error doctors")
                    }
                }else {
                    self.stopAnimating()
                    self.showAlert(title: "Doctor", message: "There is no doctors")
                }
            }else {
                self.stopAnimating()
                self.showAlert(title: "NetWork", message: "Check your network Connection")
            }
        }
        
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //        if indexPath.row == 0 {
        //            let cell: UITableViewCell =  tableView.dequeueReusableCell(withIdentifier: "MyAppointmentVCTableViewCell") as! MyAppointmentVCTableViewCell
        //            //set the data here
        //            return cell
        //        }
        //        else if indexPath.row == 1 {
        //            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentWantCancledVCTableViewCell")as! MyAppointmentWantCancledVCTableViewCell
        //            //set the data here
        //            return cell
        //        }
        //        else {
        //            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentDidCanceledVCTableViewCell")as! MyAppointmentDidCanceledVCTableViewCell
        //            //set the data here
        //            return cell
        //        }
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentVCTableViewCell", for: indexPath) as? MyAppointmentVCTableViewCell {
            cell.configureCell(item: ticketArray[indexPath.row])
            return cell
        }else{
            return  MyAppointmentVCTableViewCell()
            
        }
    }
    // write any thing 
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppointmentDetailsVC")as? AppointmentDetailsVC {
            self.navigationController?.pushViewController(vc, animated: true)
            selectedTicket = ticketArray[indexPath.row]
            vc.singleItem = selectedTicket
        }
    }
    
    
    @IBAction func BtnSignInAction (_ sender:Any){
        Helper.removeAccessToken()
    }
    
}
