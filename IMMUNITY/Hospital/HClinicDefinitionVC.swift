//
//  HospitalClinicDefinitionVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/3/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HClinicDefinitionVC: UIViewController {
    
    @IBOutlet weak var TxtFieldHospitalName: UITextField!
    @IBOutlet weak var TxtFieldHospitalAddress: UITextField!
    @IBOutlet weak var TxtFieldCity: UITextField!
    @IBOutlet weak var TxtFieldHospitalEmail: UITextField!
    @IBOutlet weak var TxtFieldHospitalWebSite: UITextField!
    @IBOutlet weak var TxtFieldHospitalMobile: UITextField!
    @IBOutlet weak var TxtFieldHospitalSpeciality: UITextField!
    @IBOutlet weak var BtnSaveOutlet :UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackgroundTF()
        BtnSaveOutlet.layer.cornerRadius = 10
        BtnSaveOutlet.clipsToBounds = true
        
    }
    
    func BackgroundTF() {
        
        TxtFieldHospitalName.MakeRoundeEdges(TxtFieldHospitalName)
        TxtFieldHospitalName.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        TxtFieldHospitalAddress.MakeRoundeEdges(TxtFieldHospitalAddress)
        TxtFieldHospitalAddress.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        TxtFieldCity.MakeRoundeEdges(TxtFieldCity)
        TxtFieldCity.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        TxtFieldHospitalEmail.MakeRoundeEdges(TxtFieldHospitalEmail)
        TxtFieldHospitalEmail.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        TxtFieldHospitalWebSite.MakeRoundeEdges(TxtFieldHospitalWebSite)
        TxtFieldHospitalWebSite.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        TxtFieldHospitalMobile.MakeRoundeEdges(TxtFieldHospitalMobile)
        TxtFieldHospitalMobile.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
        TxtFieldHospitalSpeciality.MakeRoundeEdges(TxtFieldHospitalSpeciality)
        TxtFieldHospitalSpeciality.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        
    }
    
    @IBAction func BtnSaveAction (_ sender : Any){
        
    }
    
}
