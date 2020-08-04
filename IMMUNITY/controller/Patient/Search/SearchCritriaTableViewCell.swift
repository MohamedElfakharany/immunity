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
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    @IBOutlet weak var LblDocRate: UILabel!
    @IBOutlet weak var BtnBookNowOutlet: UIButton!
    
    
    var makeReservation: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        BtnBookNowOutlet.layer.cornerRadius = 10
        BtnBookNowOutlet.clipsToBounds = true
        BackView.dropShadow(scale: true)
        backgroundView?.dropShadow(scale: true)
        gradBTNS()
        
    }
    
    func configureCell (user : SingleDoctor2){
        LblDocName.text = "DR. \(user.firstName ?? "") \(user.lastName ?? "")"
        LblDocSpeciality.text = user.specialities
        LblDocRate.text = "Doctor Rating: \(user.rating ?? 0)"
        LblDocPrice.text = "Book price : \(user.fees ?? "") LE"
        
        let urlWithoutEncoding = "\(user.image ?? "")"
        let encodedLink = urlWithoutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        DocImage.kf.indicatorType = .activity
        
        if let url = URL(string: "\(encodedURL)") {
            self.DocImage.kf.setImage(with: url)
        }
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
    
    @IBAction func BtnBookNowAction(_ sender: Any) {
        makeReservation?()
        
    }
    
}
