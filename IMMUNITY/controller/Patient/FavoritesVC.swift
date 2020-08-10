//
//  FavoritesVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/21/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class FavoritesVC: UIViewController,UITableViewDelegate, UITableViewDataSource , NVActivityIndicatorViewable{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var BtnSignInOutlet: UIButton!
    
    let cellSpacingHeight: CGFloat = 20
    var ticketArray = [singleBookingByLast]()
    var selectedTicket : singleBookingByLast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        
        if Helper.getAccessToken().role == nil {
            self.tableView.isHidden = true
            self.image.isHidden = false
            self.BtnSignInOutlet.isHidden = false
        }else {
            self.tableView.isHidden = false
            self.image.isHidden = true
            self.BtnSignInOutlet.isHidden = true
        }
        gradBTNS()
        ticketsHandleRefresh()
        
    }
    
    
    func ticketsHandleRefresh() {
        
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",  type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        
        TicketsApi.allTicketsByLAST() { (error, networkSuccess, codeSuccess, ticketArray) in
            if networkSuccess {
                if codeSuccess {
                    if let tickets = ticketArray{
                        self.ticketArray = tickets.result?.data?.data ?? []
                        print(tickets)
                        self.tableView.reloadData()
                        self.stopAnimating()
                    }else{
                        self.stopAnimating()
                        self.showAlert(title: "Error", message:  ticketArray?.message ?? "Error tickets")
                    }
                }else {
                    self.stopAnimating()
                    self.showAlert(title: "No Data", message: ticketArray?.message ?? "There are no records")
                }
            }else {
                self.stopAnimating()
                self.showAlert(title: "NetWork", message:  ticketArray?.message ?? "Check your network Connection")
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesVCTableViewCell", for: indexPath) as? FavoritesVCTableViewCell {
            cell.configureCell(item: ticketArray[indexPath.row])
            return cell
        }else{
            return  MyAppointmentVCTableViewCell()
            
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "EHRVC") as? EHRVC {
            vc.singleTicket = ticketArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func BtnSignInAction (_ sender:Any){
        Helper.removeAccessToken()
    }
    
}
