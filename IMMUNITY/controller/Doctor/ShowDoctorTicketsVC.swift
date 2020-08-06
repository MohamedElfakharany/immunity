//
//  CreateDoctorTicketsVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/2/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ShowDoctorTicketsVC: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource , NVActivityIndicatorViewable{
    
    
    
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var BTNEditOutlet: UIButton!
    @IBOutlet weak var BTNDeleteOutlet: UIButton!
    
    var singelItem: SingleBook?
    var ticketArray = [SingleBook]()
    var doctor_id = 51
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CollectionView.dataSource = self
        self.CollectionView.delegate = self
        BackView.layer.cornerRadius = 10
        BackView.clipsToBounds = true
        BackView.layer.shadowRadius = 2
        BackView.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        BackView.layer.shadowOpacity = 0.8
        BackView.dropShadow(scale: true)
        
        ticketsHandleRefresh()
        
        roundedBTN()
        
    }
    
    
    func ticketsHandleRefresh() {
        
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",  type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        
        TicketsApi.DocAllTicketsUPCOMING() { (error, networkSuccess, codeSuccess, ticketArray) in
            if networkSuccess {
                if codeSuccess {
                    if let tickets = ticketArray{
                        self.ticketArray = tickets.result?.data?.data ?? []
                        print(tickets)
                        self.CollectionView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ticketArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowDoctorTicketsCollectionViewCell", for: indexPath) as? ShowDoctorTicketsCollectionViewCell{
            cell.configureCell(item: ticketArray[indexPath.row])
            return cell
        }else{
            return ShowDoctorTicketsCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.CollectionView.frame.height , height: self.CollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "TicketInformationVC2") as? TicketInformationVC2 {
//            vc.singItem = singelItem
            vc.singleTicket = ticketArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func roundedBTN() {
        
        BTNEditOutlet.layer.cornerRadius = 10
        BTNEditOutlet.clipsToBounds = true
        
        BTNDeleteOutlet.layer.cornerRadius = 10
        BTNDeleteOutlet.clipsToBounds = true
        
    }
    
}
