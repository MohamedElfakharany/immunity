//
//  ViewController.swift
//  immunity22
//
//  Created by mayada on 2/20/20.
//  Copyright © 2020 mayada. All rights reserved.
//

import UIKit

class SearchByDoctorName: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TableView.delegate = self
        self.TableView.dataSource = self

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 193
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookDoctorTableViewCell", for: indexPath)
        return cell
    }
    
}

