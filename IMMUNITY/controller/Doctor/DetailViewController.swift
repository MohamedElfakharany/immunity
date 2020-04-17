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
    @IBOutlet weak var LblPatientCode: UILabel!
    @IBOutlet weak var LblTicketDate: UILabel!
    @IBOutlet weak var LblDoctorName: UILabel!
    @IBOutlet weak var LblPatientName: UILabel!
    
    @IBOutlet weak var BtnOutletReport: UIButton!
    @IBOutlet weak var BtnOutletDrugs: UIButton!
    @IBOutlet weak var BtnOutletRay: UIButton!
    @IBOutlet weak var BtnOutletAnalyses: UIButton!
    
    @IBOutlet weak var reportTextView: UITextView!
    @IBOutlet weak var drugsTextView: UITextView!
    @IBOutlet weak var rayTextView: UITextView!
    @IBOutlet weak var analysesTextView: UITextView!
    
    @IBOutlet weak var CofirmBTNDetail: UIButton!
    @IBOutlet weak var RejectBTNDetail: UIButton!
    
    @IBOutlet weak var DetailView: UIView!
    @IBOutlet weak var TitleView: UIView!
    
    @IBOutlet weak var ReportView: UIView!
    @IBOutlet weak var DrugView: UIView!
    @IBOutlet weak var RayView: UIView!
    @IBOutlet weak var AnalysisView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reportTextView.isHidden = true
        drugsTextView.isHidden = true
        rayTextView.isHidden = true
        analysesTextView.isHidden = true
        
        ReportView.layer.cornerRadius = 15
        ReportView.clipsToBounds = true
        
        DrugView.layer.cornerRadius = 15
        DrugView.clipsToBounds = true
        
        RayView.layer.cornerRadius = 15
        RayView.clipsToBounds = true
        
        AnalysisView.layer.cornerRadius = 15
        AnalysisView.clipsToBounds = true
        
        CofirmBTNDetail.layer.cornerRadius = 15
        RejectBTNDetail.layer.cornerRadius = 15
        CofirmBTNDetail.dropShadow()
        RejectBTNDetail.dropShadow()
        DetailView.layer.cornerRadius = 15
        DetailView.dropShadow()
        TitleView.layer.cornerRadius = 15
        TitleView.dropShadow()
        
    }
    
    @IBAction func reportButtonAction(_ sender: Any) {
        if reportTextView.isHidden ==  true {
            reportTextView.isHidden = false
            print(1)
            self.reloadInputViews()
        }else {
            reportTextView.isHidden = true
            print(2)
            self.reloadInputViews()
        }
    }
    @IBAction func drugsButtonAction(_ sender: Any) {
        
        if drugsTextView.isHidden ==  true {
            drugsTextView.isHidden = false
            self.reloadInputViews()
            print(3)
            self.reloadInputViews()
        }else {
            drugsTextView.isHidden = true
            print(4)
            self.reloadInputViews()
        }
    }
    
    @IBAction func rayButtonAction(_ sender: Any) {
        if rayTextView.isHidden ==  true {
            rayTextView.isHidden = false
            print(5)
            self.reloadInputViews()
        }else {
            rayTextView.isHidden = true
            print(6)
            self.reloadInputViews()
        }
        
    }
    @IBAction func analysesButtonAction(_ sender: Any) {
        if analysesTextView.isHidden ==  true {
            analysesTextView.isHidden = false
            print(7)
            self.reloadInputViews()
        }else {
            analysesTextView.isHidden = true
            print(8)
            self.reloadInputViews()
        }
    }
    
    @IBAction func BackBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
