//
//  TableViewCellAppoint.swift
//  Doctor
//
//  Created by Mayada on 4/1/20.
//  Copyright © 2020 Mayada. All rights reserved.
//

import UIKit

class TableViewCellAppoint: UITableViewCell {
    
    @IBOutlet weak var AppointmentCellView: UIView!
    
    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var TimeLbl: UILabel!
    @IBOutlet weak var CancelBtn: UIButton!
    @IBOutlet weak var ConfirmBtn: UIButton!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell ( item : SingleTicket2){
        DateLbl.text = "\(item.day ?? "") , \(item.date ?? "")"
        TimeLbl.text = "From: \(item.from ?? "") To: \(item.to ?? "")"
    }
    
    
}
