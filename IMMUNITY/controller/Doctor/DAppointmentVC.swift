//
//  ViewController.swift
//  Doctor
//
//  Created by Mayada on 3/31/20.
//  Copyright © 2020 Mayada. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class DAppointmentVC: UIViewController ,UITableViewDataSource,UITableViewDelegate,NVActivityIndicatorViewable{
    
    @IBOutlet weak var TableViewAppoint: UITableView!
    @IBOutlet weak var chooseDatebtn: UIButton!
    @IBOutlet weak var appointmentView: UIView!
    @IBOutlet weak var appointTxtFeild: UITextField!
    
    var ticketArray = [SingleTicket]()
    var doctor_id = Int(Helper.getDoctorId()!)
    
    
    
    let ViewCell:TableViewCellAppoint = TableViewCellAppoint()
    
    private var datePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(DAppointmentVC.dateChanged(datePicker:)), for: .valueChanged)
        appointTxtFeild.inputView = datePicker
        
        appointmentView.layer.cornerRadius = 15
        appointmentView.dropShadow()
        
        let appointmentImage = UIImage(named: "gray-downarrow")
        addRightImageTo(txtField: appointTxtFeild, andImage: appointmentImage!)
        
        let AddButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action:    #selector(HandleDetails))
        
        navigationItem.rightBarButtonItem = AddButton
        
        gradBTNS()
        
        ticketsHandleRefresh()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.TableViewAppoint.reloadData()
        ticketsHandleRefresh()
    }
    
    @objc private func HandleDetails () {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DocMoreVC"){
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func ticketsHandleRefresh() {
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",  type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        
        TicketsApi.allTicketsByDoctorId(doc_Id: doctor_id! , availability: "YES") { (error, networkSuccess, codeSuccess, ticketArray) in
            if networkSuccess {
                if codeSuccess {
                    if let tickets = ticketArray{
                        print("tickets come here")
                        print(self.doctor_id as Any)
                        self.ticketArray = tickets.data ?? []
                        print(tickets)
                        self.TableViewAppoint.reloadData()
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
    
    func addRightImageTo(txtField: UITextField , andImage img:UIImage){
        let RightImageView = UIImageView(frame: CGRect(x: 12.0, y: 10.0, width: 10.0, height: 5.0))
        RightImageView.image = img
        txtField.rightView = RightImageView
        txtField.rightViewMode = .always
        
    }
    
    @objc func dateChanged(datePicker : UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        appointTxtFeild.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = chooseDatebtn.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        chooseDatebtn.layer.insertSublayer(gradientLayer, at: 0)
        
        chooseDatebtn.layer.cornerRadius = 10
        chooseDatebtn.clipsToBounds = true
    }//EndGrad
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:"AppointCell", for: indexPath) as? TableViewCellAppoint{
            
            cell.configureCell(item: ticketArray[indexPath.row])
            cell.AppointmentCellView.layer.cornerRadius = 15
            cell.AppointmentCellView.dropShadow()
            cell.ConfirmBtn.layer.cornerRadius = 10
            cell.CancelBtn.layer.cornerRadius = 10
            cell.DetailsBtn.layer.cornerRadius = 10
            let bounds: CGRect = cell.DateLbl.bounds
            let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: ([.topLeft, .topRight]), cornerRadii: CGSize(width: 15.0, height: 15.0))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = bounds
            maskLayer.path = maskPath.cgPath
            cell.DateLbl.layer.mask = maskLayer
            return cell
        }else  {
            return TableViewCellAppoint()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            vc.singleTicket = ticketArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketArray.count
    }
    
    
}
