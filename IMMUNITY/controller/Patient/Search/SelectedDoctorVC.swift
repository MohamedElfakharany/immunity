//
//  SelectedDoctorVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/18/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
import UIKit

class SelectedDoctorVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
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
    
    var singelItem: SingleDoctor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LblDocName.text = "DR. \(singelItem?.firstName ?? "") \(singelItem?.lastName ?? "")"
        LblDocSpeciality.text = "\(singelItem?.specialities ?? "")"
        LblDocAddress.text = "Address: \(singelItem?.city ?? "")"
        LblDocPrice.text = "Price: \(singelItem?.fees ?? "")"
        LblDocUniversty.text = "Rate: \(singelItem?.rate ?? "")"
        TxtviewDocInfo.text = singelItem?.info
        
        let urlWithOutEncoding = "\(singelItem?.image ?? "")"
        let encodedLink = urlWithOutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        DocImage.kf.indicatorType = .activity
        DocImage.kf.setImage(with: encodedURL)
        
        
        
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedDoctorCollectionViewCell", for: indexPath) as? SelectedDoctorCollectionViewCell
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.CollectionView.frame.height , height: self.CollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "TicketInformationVC") as? TicketInformationVC {
            vc.singItem = singelItem
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func BtnVisOpinionAction(_ sender: Any) {
        
        let popup = PopupVisitorRatingVC.create()
        let sbPopup = SBCardPopupViewController(contentViewController: popup)
        sbPopup.show(onViewController: self)
    }
    
}
