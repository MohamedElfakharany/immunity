//
//  EHRVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/9/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import  Kingfisher

class EHRVC: UIViewController {
    
        @IBOutlet weak var LblDoctorName: UILabel!
        @IBOutlet weak var LblTicketDate: UILabel!
        @IBOutlet weak var LblFromTo: UILabel!
        @IBOutlet weak var LblDay: UILabel!
        
        @IBOutlet weak var BtnOutletReport: UIButton!
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
            
            self.LblDoctorName.text = "DR. \(singleTicket?.firstName ?? "") \(singleTicket?.lastName ?? "")"
            self.LblTicketDate.text = "\(singleTicket?.date ?? "")"
            self.LblFromTo.text = "\(singleTicket?.from ?? "" ) To :\(singleTicket?.to ?? "")"
            self.LblDay.text = "\(singleTicket?.day ?? "")"
            self.reportTextView.text = "\(singleTicket?.note ?? "")"
            let urlWithOutEncoding = "\(self.singleTicket?.prescrptionImage ?? "")"
            let encodedLink = urlWithOutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
            let encodedURL = NSURL(string: encodedLink!)! as URL
            self.DrugImageView.kf.indicatorType = .activity
            self.DrugImageView.kf.setImage(with: encodedURL)
            
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
        
        @IBAction func reportButtonAction(_ sender: Any) {
            
            
        }
        
        
        @IBAction func drugsButtonAction(_ sender: Any) {
            
        }
        
        
        @IBAction func BackBtn(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
        
        
}
