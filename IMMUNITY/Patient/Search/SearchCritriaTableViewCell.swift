//
//  SearchCritriaTableViewCell.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/17/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
import UIKit

class SearchCritriaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocRate: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    @IBOutlet weak var LblDocUniversty: UILabel!
    @IBOutlet weak var BtnBookNowOutlet: UIButton!
    
    
    var makeReservation: (()->())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        BtnBookNowOutlet.layer.cornerRadius = 5
        BtnBookNowOutlet.clipsToBounds = true
        // Image
        //        DocImage.clipsToBounds = true
        //        DocImage.layer.cornerRadius = DocImage.frame.width/2
        //        DocImage.layer.cornerRadius = DocImage.frame.height/2
        //        DocImage.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //        DocImage.layer.borderWidth = 2
        
        //cell back view
        BackView.layer.cornerRadius = 10
        BackView.clipsToBounds = true
        BackView.layer.shadowRadius = 2
        BackView.layer.shadowColor = UIColor.gray.cgColor
        BackView.layer.shadowOpacity = 0.8
        
        gradBTNS()
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnBookNowOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnBookNowOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnBookNowOutlet.layer.cornerRadius = 10
        BtnBookNowOutlet.clipsToBounds = true
    }//EndGrad
    
    /* func setupCell(_ doc: Doctor){
     
     LblDocName.text = doc.name
     LblDocRate.text = "\(doc.rating ?? 0)"
     LblDocSpeciality.text = doc.specialty?.name
     LblDocAddress.text = doc.clinic?.address
     LblDocPrice.text = " سعر الكشف : \(doc.fee ?? 0)"
     //        LblDocAvilability.text = doc.
     
     let url = URL(string: "\(URLs.base)\(doc.imageURL ?? "")")
     DocImage.kf.indicatorType = .activity
     let image = UIImage(named: "manChoose")
     DocImage.kf.setImage(with: url, placeholder: image)
     }*/
    
    @IBAction func BtnBookNowAction(_ sender: Any) {
        makeReservation?()
        
        //        SelectedDoctorVC
        
        
    }
    
}
