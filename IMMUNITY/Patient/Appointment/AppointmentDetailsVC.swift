//
//  AppointmentDetailsVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/24/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class AppointmentDetailsVC: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.dropShadow(scale: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentDetailsTableViewCell", for: indexPath)
        return cell
    }
    

}
