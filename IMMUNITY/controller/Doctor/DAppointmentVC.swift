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
    
    var ticketArray = [SingleBook]()
    var doctor_id = 51
    
    let ViewCell:TableViewCellAppoint = TableViewCellAppoint()
    
    lazy var Refresher : UIRefreshControl = {
        let Refresher = UIRefreshControl()
        Refresher.addTarget(self, action: #selector(ticketsHandleRefresh), for: .valueChanged)
        return Refresher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewAppoint.tableFooterView = UIView()
        TableViewAppoint.separatorInset = .zero
        TableViewAppoint.contentInset = .zero
        TableViewAppoint.addSubview(Refresher)
        ticketsHandleRefresh()
    }
    
    @objc func ticketsHandleRefresh() {
        self.Refresher.endRefreshing()
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",  type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        
        TicketsApi.DocAllTicketsGrtBookings() { (error, networkSuccess, codeSuccess, ticketArray) in
            if networkSuccess {
                if codeSuccess {
                    if let tickets = ticketArray{
                        print("tickets come here")
                        print(self.doctor_id as Any)
                        self.ticketArray = tickets.result?.data?.data ?? []
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
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:"AppointCell", for: indexPath) as? TableViewCellAppoint{
            
            cell.configureCell(item: ticketArray[indexPath.row])
            cell.AppointmentCellView.layer.cornerRadius = 15
            cell.AppointmentCellView.dropShadow()
            cell.ConfirmBtn.layer.cornerRadius = 10
            cell.CancelBtn.layer.cornerRadius = 10
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketArray.count
    }
    
    
}
