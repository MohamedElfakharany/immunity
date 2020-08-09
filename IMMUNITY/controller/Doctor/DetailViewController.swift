//
//  DetailViewController.swift
//  Doctor
//
//  Created by Mayada on 4/5/20.
//  Copyright © 2020 Mayada. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var LblTicketNumber: UILabel!
    @IBOutlet weak var LblDoctorCode: UILabel!
    @IBOutlet weak var LblTicketDate: UILabel!
    @IBOutlet weak var LblDoctorName: UILabel!
    
    @IBOutlet weak var BtnOutletReport: UIButton!
    @IBOutlet weak var reportTextView: UITextView!
    
    @IBOutlet weak var BtnOutletDrugs: UIButton!
    @IBOutlet weak var DrugImageView: UIImageView!
    
    @IBOutlet weak var CofirmBTNDetail: UIButton!
    @IBOutlet weak var RejectBTNDetail: UIButton!
    
    @IBOutlet weak var DetailView: UIView!
    @IBOutlet weak var TitleView: UIView!
    
    @IBOutlet weak var ReportView: UIView!
    @IBOutlet weak var DrugView: UIView!
    
    var singleTicket : SingleTicket2?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.LblDoctorName.text = singleTicket?.docName
        
        
        
       
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
        
        CofirmBTNDetail.layer.cornerRadius = 15
        RejectBTNDetail.layer.cornerRadius = 15
        
        DetailView.layer.cornerRadius = 15
        
        TitleView.layer.cornerRadius = 15
        
        CofirmBTNDetail.dropShadow()
        RejectBTNDetail.dropShadow()
        
        DetailView.dropShadow()
        
        TitleView.dropShadow()
        
    }
    
    @IBAction func reportButtonAction(_ sender: Any) {
        
        
    }
    
    
    @IBAction func drugsButtonAction(_ sender: Any) {
        
    }

    
    @IBAction func BackBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
