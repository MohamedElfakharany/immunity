//
//  SearchByArea&SpecialityVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/15/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
import UIKit

class SearchByArea_SpecialityVC: UIViewController , UITextFieldDelegate, UIPickerViewDelegate ,UIPickerViewDataSource  {
    
    var PickerView = UIPickerView()
    var Cities = ["cairo","ismailia","port said"]
    var Specialities = ["sight","bones","kids","heart","surgery"]
    var selectedCity = String()
    var selectedSpeciality = String()
    
    @IBOutlet weak var TxtfieldSelectCity: UITextField!
    @IBOutlet weak var TxtfieldSelectGovernments: UITextField!
    @IBOutlet weak var TxtfieldSelectSpeciality: UITextField!
    
    @IBOutlet weak var BtnOutletSearch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.PickerView.delegate = self
        self.PickerView.dataSource = self
        
        TxtfieldSelectSpeciality.inputView = PickerView
        TxtfieldSelectCity.inputView = PickerView
        
        gradBTNS()
        BackgroundTF()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if   TxtfieldSelectCity.isEditing {
            return Cities.count
        }else if TxtfieldSelectSpeciality.isEditing{
            return Specialities.count
        }else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if  TxtfieldSelectCity.isEditing {
            return Cities[row]
        }else if TxtfieldSelectSpeciality.isEditing {
            return Specialities[row]
        }else {
            
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if   TxtfieldSelectCity.isEditing {
            TxtfieldSelectCity.text = Cities[row]
            self.selectedCity = Cities[row]
            self.view.endEditing(true)
        }else if TxtfieldSelectSpeciality.isEditing {
            TxtfieldSelectSpeciality.text = Specialities[row]
            self.selectedSpeciality = Specialities[row]
            self.view.endEditing(true)
        }else {
            return
        }
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnOutletSearch.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletSearch.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnOutletSearch.layer.cornerRadius = 10
        BtnOutletSearch.clipsToBounds = true
    }//EndGrad
    
    func BackgroundTF() {
        
        if let myImage = UIImage(named: "gray-downarrow"){
            TxtfieldSelectCity.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtfieldSelectCity.MakeRoundeEdges(TxtfieldSelectCity)
            TxtfieldSelectCity.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        }
        
        if let myImage = UIImage(named: "gray-downarrow"){
            TxtfieldSelectSpeciality.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtfieldSelectSpeciality.MakeRoundeEdges(TxtfieldSelectSpeciality)
            TxtfieldSelectSpeciality.addShadowToTextField(color: UIColor.black, cornerRadius: 5)
        }
    }
    @IBAction func BtnSearchAction(_ sender: Any) {
        
        guard let City = TxtfieldSelectCity.text , !City.isEmpty else {
            let message = NSLocalizedString("Choose the city", comment: "hhh")
            let title = NSLocalizedString("Search failed", comment: "hhh")
            self.showAlert(title: title, message: message)
            return
        }
        
        guard let speciality = TxtfieldSelectSpeciality.text , !speciality.isEmpty else {
            let message = NSLocalizedString("Choose the speciality", comment: "hhh")
            let title = NSLocalizedString("Search failed", comment: "hhh")
            self.showAlert(title: title, message: message)
            return
        }
        
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchCritriaVC") as? SearchCritriaVC {
            vc.SelectedSpeciality = TxtfieldSelectSpeciality.text ?? ""
            vc.SelectedCity = TxtfieldSelectCity.text ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
}
