
//
//  FavoritesVCTableViewCell.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/29/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class FavoritesVCTableViewCell: UITableViewCell {


    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var prescrption_image: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var lblTicketDate: UILabel!
    @IBOutlet weak var lblTicketFromTo: UILabel!
    @IBOutlet weak var lblPayment: UILabel!
    @IBOutlet weak var BtnDetectedOutlet: UIButton!
    @IBOutlet weak var BtnDetailsOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        
        BtnDetailsOutlet.layer.cornerRadius = 10
        BtnDetailsOutlet.clipsToBounds = true
        BackView.dropShadow(scale: true)
        gradBTNS()
        
    }
    
    func configureCell (item : singleBookingByLast){
        lblTicketDate.text = "\(item.day ?? ""), \(item.date ?? "")"
        LblDocName.text = "DR. \(item.firstName ?? "") \(item.lastName ?? "")"
        
        let urlWithOutEncoding = "\(item.doctorImage ?? "")"
        let encodedLink = urlWithOutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        self.DocImage.kf.indicatorType = .activity
        self.DocImage.kf.setImage(with: encodedURL)
    }
    
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnDetectedOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnDetectedOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnDetectedOutlet.layer.cornerRadius = 10
        BtnDetectedOutlet.clipsToBounds = true
        
    }
    
}
