//
//  TicketInformationVC2.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/5/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class TicketInformationVC2: UIViewController , NVActivityIndicatorViewable{

    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    @IBOutlet weak var LblDocAppintmentDay: UILabel!
    @IBOutlet weak var LblDocAppintment: UILabel!
    @IBOutlet weak var BtnConfirmOutlet: UIButton!
    
    var singItem: SingleDoctor2?
    var singleTicket: SingleBook?
    var ticketArray = [SingleTicket2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cell back view
        BackView.layer.cornerRadius = 20
        BackView.clipsToBounds = true
        BackView.layer.shadowRadius = 4
        BackView.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        BackView.layer.shadowOpacity = 0.1
        
        BackView.dropShadow(scale: true)
        self.navigationController?.title = ""
        gradBTNS()
        LblDocName.text = "DR. \(singItem?.firstName ?? "") \(singItem?.lastName ?? "")"
        LblDocPrice.text = "Book Price: \(singItem?.fees ?? "") LE"
        LblDocAppintmentDay.text = "Next \(singleTicket?.day ?? "")"
        LblDocAppintment.text = "From: \(singleTicket?.from ?? "") To: \(singleTicket?.to ?? "")"
        LblDocSpeciality.text = singItem?.specialities ?? ""
        let urlWithoutEncoding = "\(singItem?.image ?? "")"
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
        // First BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnConfirmOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnConfirmOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnConfirmOutlet.layer.cornerRadius = 10
        BtnConfirmOutlet.clipsToBounds = true
        
    }
    
    @IBAction func BtnConfirmAction(_ sender: Any) {
        
    }
    
    
}
