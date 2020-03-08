//
//  ViewController.swift
//  immunity22
//
//  Created by mayada on 2/20/20.
//  Copyright © 2020 mayada. All rights reserved.
//

import UIKit
import Alamofire

class SearchByDoctorName: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var doc = [SingleDoctor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
    
        
        getDoctors()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    func getDoctors() {
        
        let headers: HTTPHeaders = [
            "APP_KEY": "123456"
        ]
        
        Alamofire.request(URLs.mainDoctors, method: .get, parameters: nil, encoding: URLEncoding.queryString , headers: headers).responseJSON {(response) in
            do {
                print (response)
                let allDoctors = try JSONDecoder().decode(MainDoctors.self, from: response.data!)
                print(allDoctors)
            } catch {
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doc.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 193
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "BookDoctorTableViewCell", for: indexPath) as? BookDoctorTableViewCell {
            cell.configureCell(user: doc[indexPath.row])
            return cell
        }else {
        return BookDoctorTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectedDoctorVC") as? SelectedDoctorVC{
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}

