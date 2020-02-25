//
//  SearchCritriaVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/17/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
import UIKit

class SearchCritriaVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var TxtViewCity: UITextView!
    @IBOutlet weak var TxtViewSpeciality: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var BackView:UIView!
    
    var SelectedSpeciality = ""
    var SelectedCity = ""
    let cellSpacingHeight: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.TxtViewSpeciality.text = SelectedSpeciality
        self.TxtViewCity.text = SelectedCity
        
//        BackView.clipsToBounds = true
//        BackView.layer.cornerRadius = 10
//        if #available(iOS 11.0, *) {
//            BackView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//        } else {
//            // Fallback on earlier versions
//            BackView.layer.cornerRadius = 10
//        }
        BackView.dropShadow(scale: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCritriaTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectedDoctorVC") as? SelectedDoctorVC{
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.cornerRadius = 30
        layer.masksToBounds = false
        layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
