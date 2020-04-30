//
//  ViewController.swift
//  Doctor
//
//  Created by Mayada on 3/31/20.
//  Copyright © 2020 Mayada. All rights reserved.
//

import UIKit

class DAppointmentVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var TableViewAppoint: UITableView!
    @IBOutlet weak var chooseDatebtn: UIButton!
    @IBOutlet weak var appointmentView: UIView!
    @IBOutlet weak var appointTxtFeild: UITextField!
    
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
        
    }
    @objc private func HandleDetails () {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DocMoreVC"){
            self.navigationController?.pushViewController(vc, animated: true)
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
        let cell:TableViewCellAppoint = tableView.dequeueReusableCell(withIdentifier:"AppointCell", for: indexPath) as! TableViewCellAppoint
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
}
