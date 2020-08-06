//
//  MyAppointmentVCTableViewCell.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/21/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class MyAppointmentVCTableViewCell: UITableViewCell {

    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var lblTicketDate: UILabel!
    @IBOutlet weak var lblTicketFromTo: UILabel!
    @IBOutlet weak var lblDocName: UILabel!
    @IBOutlet weak var lblPayment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        BackView.dropShadow(scale: true)
        lblTicketDate.roundCorners(corners: .topLeft, radius: 15.0)
        lblTicketDate.roundCorners(corners: .topRight, radius: 15.0)
    }
    
    func configureCell (item : SingleBook){
        lblTicketDate.text = "\(item.day ?? ""), \(item.date ?? "")"
        lblDocName.text = "DR. \(item.firstName ?? "") \(item.lastName ?? "")"
        lblTicketFromTo.text = "From: \(item.from ?? "") To: \(item.to ?? "")"
        lblPayment.text = "Payment Way: \(item.payment ?? "")"
    }
    
    
}
