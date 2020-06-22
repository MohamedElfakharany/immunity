//
//  HEditDoctorSearchTableViewCell.swift
//  IMMUNITY
//
//  Created by elfakharany on 6/16/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Kingfisher

class HEditDoctorSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var BackView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        BackView.dropShadow(scale: true)
        
    }
    
    func configureCell (user : SingleDoctor){
        LblDocName.text = "DR. \(user.firstName ?? "") \(user.lastName ?? "")"
        LblDocSpeciality.text = user.specialities
        
        let urlWithoutEncoding = "\(user.image!)"
        let encodedLink = urlWithoutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        DocImage.kf.indicatorType = .activity
        
        if let url = URL(string: "\(encodedURL)") {
            self.DocImage.kf.setImage(with: url)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
