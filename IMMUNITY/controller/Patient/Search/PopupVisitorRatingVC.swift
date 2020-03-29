//
//  PopupVisitorRatingVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/19/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
import UIKit
import Cosmos

class PopupVisitorRatingVC: UIViewController ,SBCardPopupContent ,  UITableViewDelegate , UITableViewDataSource{
    
    var popupViewController: SBCardPopupViewController?
    var allowsTapToDismissPopupCard: Bool = true
    var allowsSwipeToDismissPopupCard: Bool = true
    
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        
        BackView.layer.cornerRadius = 10
        
    }
    
    static func create() -> UIViewController {
        let vc = UIStoryboard.init(name: "Patient", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopupVisitorRatingVC") as! PopupVisitorRatingVC
        return vc
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisitorRatingTableViewCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    @IBAction func BtnCancelAcyion(_ sender : UIButton) {
        self.popupViewController?.close()
    }
    
}
