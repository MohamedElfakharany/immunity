//
//  SelectedDoctorVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/18/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
import UIKit
import NVActivityIndicatorView

class SelectedDoctorVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , NVActivityIndicatorViewable {
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    @IBOutlet weak var LblDocUniversty: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var TxtviewDocInfo: UITextView!
    @IBOutlet weak var BtnVisOpinionOutlet: UIButton!
    
    var singelItem: SingleDoctor2?
    var ticketArray = [SingleTicket2]()
    var doctor_id = 54
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doctor_id = singelItem?.id ?? 0
        
        LblDocName.text = "DR. \(singelItem?.firstName ?? "") \(singelItem?.lastName ?? "")"
        LblDocSpeciality.text = "\(singelItem?.specialities ?? "")"
        LblDocPrice.text = "Price: \(singelItem?.fees ?? "") LE"
        LblDocUniversty.text = "Doctor Rating: \(singelItem?.rating ?? 0)"
        print("singelItem  \(singelItem!)")
        print("doctor_id  \(doctor_id)")
        let urlWithOutEncoding = "\(singelItem?.image ?? "")"
        let encodedLink = urlWithOutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        DocImage.kf.indicatorType = .activity
        DocImage.kf.setImage(with: encodedURL)
        
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
        
        //cell back view
        BackView.layer.cornerRadius = 10
        BackView.clipsToBounds = true
        BackView.layer.shadowRadius = 2
        BackView.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        BackView.layer.shadowOpacity = 0.8
        self.CollectionView.layer.cornerRadius = 10
        self.CollectionView.layer.shadowRadius = 2
        self.CollectionView.layer.shadowColor = UIColor.gray.cgColor
        self.CollectionView.layer.shadowOpacity = 0.4
        self.navigationController?.title = ""
        BackView.dropShadow(scale: true)
        gradBTNS()
        BackView.dropShadow(scale: true)
        ticketsHandleRefresh()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.CollectionView.reloadData()
        ticketsHandleRefresh()
    }
    
    
    func ticketsHandleRefresh() {
        startAnimating(CGSize(width: 45, height: 45), message: "Loading",  type: .ballSpinFadeLoader, color: .orange, textColor: .white)
        
        TicketsApi.allTicketsByDoctorId(doc_Id: doctor_id , availability: "YES") { (error, networkSuccess, codeSuccess, ticketArray) in
            if networkSuccess {
                if codeSuccess {
                    if let tickets = ticketArray{
                        self.stopAnimating()
                        self.ticketArray = tickets.result?.tickets ?? []
                        print(tickets)
                        self.CollectionView.reloadData()
                        
                    }else{
                        self.stopAnimating()
                        self.showAlert(title: "Error", message: "Error doctors")
                    }
                }else {
                    self.stopAnimating()
                    self.showAlert(title: "Doctor", message: "There is no doctors")
                }
            }else {
                self.stopAnimating()
                self.showAlert(title: "NetWork", message: "Check your network Connection")
            }
        }
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.537254902, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.9647058824, green: 0.7960784314, blue: 0.7921568627, alpha: 1)
        // First BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnVisOpinionOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnVisOpinionOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnVisOpinionOutlet.layer.cornerRadius = 10
        BtnVisOpinionOutlet.clipsToBounds = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ticketArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedDoctorCollectionViewCell", for: indexPath) as? SelectedDoctorCollectionViewCell{
            cell.configureCell(item: ticketArray[indexPath.row])
            return cell
        }else{
        return SelectedDoctorCollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.CollectionView.frame.height , height: self.CollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "TicketInformationVC") as? TicketInformationVC {
            vc.singItem = singelItem
            vc.singleTicket = ticketArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func BtnVisOpinionAction(_ sender: Any) {
        
        let popup = PopupVisitorRatingVC.create()
        let sbPopup = SBCardPopupViewController(contentViewController: popup)
        sbPopup.show(onViewController: self)
    }
    
}
