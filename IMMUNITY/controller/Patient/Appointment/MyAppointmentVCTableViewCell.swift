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
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var BtnDetailsOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        BtnDetailsOutlet.layer.cornerRadius = 10
        BtnDetailsOutlet.clipsToBounds = true
        BackView.dropShadow(scale: true)
        
    }
    
    func configureCell (item : SingleTicket){
        LblDocName.text = item.docName ?? ""
        lblTicketDate.text = "\(item.day ?? "") , \(item.date ?? "")"
    }
    
    
}
