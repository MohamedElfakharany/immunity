//
//  AppointmentDetailsTableViewCell.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/25/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class AppointmentDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LblDrugName:UILabel!
    @IBOutlet weak var LblDrugDose:UILabel!
    @IBOutlet weak var LblDrugPeriod:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
