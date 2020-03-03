//
//  MyAppointmentVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/20/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class MyAppointmentVC: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellSpacingHeight: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.backgroundView?.backgroundColor = UIColor.clear
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: UITableViewCell =  tableView.dequeueReusableCell(withIdentifier: "MyAppointmentVCTableViewCell") as! MyAppointmentVCTableViewCell
            //set the data here
            return cell
        }
        else if indexPath.row == 1 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentWantCancledVCTableViewCell")as! MyAppointmentWantCancledVCTableViewCell
            //set the data here
            return cell
        }
        else {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyAppointmentDidCanceledVCTableViewCell")as! MyAppointmentDidCanceledVCTableViewCell
            //set the data here
            return cell
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}
