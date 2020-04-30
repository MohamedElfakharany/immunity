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
    @IBOutlet weak var DetailsBtn: UIButton!
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
    
    @IBAction func BtnDetailsAction(_ sender : Any){
        
    }
    
}
