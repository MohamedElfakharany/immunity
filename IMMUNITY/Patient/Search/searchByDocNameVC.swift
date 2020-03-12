//
//  ViewController.swift
//  immunity22
//
//  Created by mayada on 2/20/20.
//  Copyright © 2020 mayada. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import NVActivityIndicatorView

class searchByDocNameVC: UIViewController ,UITableViewDelegate,UITableViewDataSource, NVActivityIndicatorViewable{
    
    @IBOutlet weak var DocNameSearch: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var docArray : [SingleDoctor] = [SingleDoctor]()
    var searching = false
    var selectedDoc : [SingleDoctor] = [SingleDoctor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        
        doctorsHandleRefresh()
        getDoctors()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    func doctorsHandleRefresh() {
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        
        DoctorAPI.allDoctors { (error, networkSuccess, codeSucess, docArray) in
            if networkSuccess {
                if codeSucess {
                    if let docs = docArray{
                        self.docArray = docs.data ?? []
                        print("zzzz\(docs)")
                        self.tableView.reloadData()
                        self.tableView.endUpdates()
                        self.stopAnimating()
                    }else {
                        self.stopAnimating()
                        self.showAlert(title: "Error", message: "Error favorite")
                    }
                    
                }else {
                    self.stopAnimating()
                    self.showAlert(title: "Favorite", message: "Favorite is empty")
                }
            }else {
                self.stopAnimating()
                self.showAlert(title: "Network", message: "Check your network connection")
            }
        }
        
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
        if searching {
            return selectedDoc.count
        }else {
            return docArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 193
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "BookDoctorTableViewCell", for: indexPath) as? BookDoctorTableViewCell {
            if searching {
                cell.configureCell(user: selectedDoc[indexPath.row])
            }else {
                cell.configureCell(user: docArray[indexPath.row])
            }
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
    
    // keybord down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}


extension searchByDocNameVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == "" {
            searching = false
            print ("not typing")
            self.tableView.reloadData()
        } else {
            print("typing")
            searching = true
            selectedDoc.removeAll()
            for oneDoctor in docArray {
                if oneDoctor.firstName?.contains(searchText) ?? false {
                    self.selectedDoc.append(oneDoctor)
                    print(oneDoctor)
                    self.tableView.reloadData()
                }else {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
        
        searching = false
        searchBar.text = ""
        tableView.reloadData()
        // keybord down
        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return true
        }
    }
}
