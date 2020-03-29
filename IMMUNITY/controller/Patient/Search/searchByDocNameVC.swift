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
    
    
    fileprivate var activityIndicator: LoadMoreActivityIndicator!
    
    var docArray = [SingleDoctor]()
    var searching = false
    var selectedDoc = [SingleDoctor]()
    var choosedDoctor = [SingleDoctor]()
    var curentPage = 1
    var lastPage = 1
    var isLoading:Bool = false
    
    lazy var Refresher : UIRefreshControl = {
        let Refresher = UIRefreshControl()
        Refresher.addTarget(self, action: #selector(getDoctors), for: .valueChanged)
        return Refresher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.DocNameSearch.showsCancelButton = false
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        tableView.addSubview(Refresher)
        
        doctorsHandleRefresh()
        getDoctors()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        doctorsHandleRefresh()
        
    }
    
    func doctorsHandleRefresh() {
        
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        DoctorAPI.allDoctors(page: curentPage) { (error, networkSuccess, codeSucess, docArray) in
            if networkSuccess {
                if codeSucess {
                    if let docs = docArray{
                        self.docArray = docs.data ?? []
                        self.curentPage = docs.meta?.currentPage ?? 1
                        print("curent page: \(docs.meta?.currentPage ?? 0)")
//                        print("zzzz\(docs)")
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
    
    @objc func getDoctors() {
        self.Refresher.endRefreshing()
        
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
            

                    if searching {
                        vc.singelItem = selectedDoc[indexPath.row]
                    }else {
                        vc.singelItem = docArray[indexPath.row]
            }
               
            
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
            self.DocNameSearch.showsCancelButton = false
            searching = false
            print ("not typing")
            self.tableView.reloadData()
        } else {
            self.DocNameSearch.showsCancelButton = true
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
        self.DocNameSearch.showsCancelButton = false
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
