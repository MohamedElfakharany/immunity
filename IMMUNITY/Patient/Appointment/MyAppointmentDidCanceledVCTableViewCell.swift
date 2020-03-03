//
//  MyAppointmentDidCanceledVCTableViewCell.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/29/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class MyAppointmentDidCanceledVCTableViewCell: UITableViewCell {
   
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblCanceledAppointment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        LblCanceledAppointment.diagonalStrikeThrough()
        BackView.dropShadow(scale: true)
        
    }
    
}

extension UILabel {
    /// Strikes through diagonally
    /// - Parameters:
    /// - offsetPercent: Improve visual appearance or flip line completely by passing a value between 0 and 1
    func diagonalStrikeThrough(offsetPercent: CGFloat = 0.1) {
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: bounds.height * (1 - offsetPercent)))
        linePath.addLine(to: CGPoint(x: bounds.width, y: bounds.height * offsetPercent))
        
        let lineLayer = CAShapeLayer()
        lineLayer.path = linePath.cgPath
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = textColor.cgColor
        layer.addSublayer(lineLayer)
    }
}
