//
//  SelectedDoctorCollectionViewCell.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/18/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
import UIKit

class SelectedDoctorCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var LblDay: UILabel!
    @IBOutlet weak var LblDate: UILabel!
    @IBOutlet weak var LblTime: UILabel!
    @IBOutlet weak var LblDuration: UILabel!
    @IBOutlet weak var BackView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        BackView.dropShadow(scale: true)
        
        BackView.layer.cornerRadius = 10
        BackView.clipsToBounds = true
        BackView.layer.shadowRadius = 2
        BackView.layer.shadowColor = UIColor.gray.cgColor
        BackView.layer.shadowOpacity = 0.8
    }
    
    func configureCell ( item : SingleTicket2){
        LblDay.text = item.day ?? ""
//        LblDate.text = item.date ?? ""
        LblTime.text = "From: \(item.from ?? "") To: \(item.to ?? "")"
        LblDuration.text = "Duration: \(item.duration ?? "")"
    }
    
    
}
