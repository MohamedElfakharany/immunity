//
//  SearchCritriaVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/17/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
import UIKit
import Alamofire
import Kingfisher
import NVActivityIndicatorView

class SearchCritriaVC: UIViewController ,UITableViewDelegate,UITableViewDataSource, NVActivityIndicatorViewable{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var TxtViewCity: UITextView!
    @IBOutlet weak var TxtViewSpeciality: UITextView!
    @IBOutlet weak var BackView:UIView!
    
    private var doc = [SingleDoctor]()
    var SelectedSpeciality = ""
    var SelectedCity = ""
    let cellSpacingHeight: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "Select doctor"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        
        self.TxtViewSpeciality.text = SelectedSpeciality
        self.TxtViewCity.text = SelectedCity
        self.navigationController?.title = ""
        
        BackView.dropShadow(scale: true)
        doctorsHandleRefresh()
        getDoctors()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    func doctorsHandleRefresh() {
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        
        DoctorAPI.allDoctorsByAreaAndSpeciality(city: SelectedCity, speciality: SelectedSpeciality, page: 0) { (error, networkSuccess, codeSucess, doc ) in
            if networkSuccess {
                if codeSucess {
                    if let docs = doc{
                        self.doc = docs.data ?? []
                        print("zzzz\(docs)")
                        print(Parameters.self)
                        self.tableView.reloadData()
                        self.tableView.endUpdates()
                        self.stopAnimating()
                    }else {
                        self.stopAnimating()
                        self.showAlert(title: "Error", message: "Error doctors")
                    }
                    
                }else {
                    self.stopAnimating()
                    self.showAlert(title: "Favorite", message: "There is no doctors")
                }
            }else {
                self.stopAnimating()
                self.showAlert(title: "Network", message: "Check your network connection")
            }
        }
        
    }
    
    func getDoctors() {
        
        let parameters = [
            
            "city": SelectedCity,
            "specialities" : SelectedSpeciality
        ]
        
        let headers: HTTPHeaders = [
            "APP_KEY": "123456"
        ]
        
        Alamofire.request(URLs.mainDoctors, method: .get, parameters: parameters as Parameters, encoding: URLEncoding.queryString , headers: headers).responseJSON {(response) in
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
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "SearchCritriaTableViewCell", for: indexPath) as? SearchCritriaTableViewCell {
            cell.configureCell(user: doc[indexPath.row])
            //            print ("table view after cell for row at")
            
            return cell
        }else {
            return SearchCritriaTableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectedDoctorVC") as? SelectedDoctorVC{
            self.navigationController?.pushViewController(vc, animated: true)
            vc.singelItem = doc[indexPath.row]
        }
    }
    
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.cornerRadius = 15
        layer.masksToBounds = false
        layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}
