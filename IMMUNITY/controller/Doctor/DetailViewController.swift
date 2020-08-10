//
//  DetailViewController.swift
//  Doctor
//
//  Created by Mayada on 4/5/20.
//  Copyright © 2020 Mayada. All rights reserved.
//

import UIKit
import  Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var LblPatientName: UILabel!
    @IBOutlet weak var LblTicketDate: UILabel!
    @IBOutlet weak var LblFromTo: UILabel!
    @IBOutlet weak var LblDay: UILabel!
    
     @IBOutlet weak var reportTextView: UITextView!
    
    @IBOutlet weak var BtnOutletDrugs: UIButton!
    @IBOutlet weak var DrugImageView: UIImageView!
    
    
    @IBOutlet weak var DetailView: UIView!
    @IBOutlet weak var TitleView: UIView!
    
    @IBOutlet weak var ReportView: UIView!
    @IBOutlet weak var DrugView: UIView!
    
    var singleTicket : singleBookingByLast?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      self.LblPatientName.text = "DR. \(singleTicket?.firstName ?? "") \(singleTicket?.lastName ?? "")"
        self.LblTicketDate.text = "\(singleTicket?.date ?? "")"
        self.LblFromTo.text = "\(singleTicket?.from ?? "" ) To :\(singleTicket?.to ?? "")"
        self.LblDay.text = "\(singleTicket?.day ?? "")"
        
        setupView()
        
    }
    
    func setupView() {
//        reportTextView.isHidden = true
//        drugsTextView.isHidden = true
//        rayTextView.isHidden = true
//        analysesTextView.isHidden = true
        
        ReportView.layer.cornerRadius = 15
        ReportView.clipsToBounds = true
        
        DrugView.layer.cornerRadius = 15
        DrugView.clipsToBounds = true
        
        DetailView.layer.cornerRadius = 15
        
        TitleView.layer.cornerRadius = 15
        
        DetailView.dropShadow()
        
        TitleView.dropShadow()
        
    }
    
    @IBAction func BtnActionDrugs(_ sender: Any) {
        
        
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
