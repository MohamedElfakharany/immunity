//
//  CreateDoctorTicketsVC.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/2/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class ShowDoctorTicketsVC: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowDoctorTicketsCollectionViewCell", for: indexPath) as? ShowDoctorTicketsCollectionViewCell{
            
            return cell
        }else{
            return ShowDoctorTicketsCollectionViewCell()
        }
    }
    
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var BTNEditOutlet: UIButton!
    @IBOutlet weak var BTNDeleteOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackView.layer.cornerRadius = 10
        BackView.clipsToBounds = true
        BackView.layer.shadowRadius = 2
        BackView.layer.shadowColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        BackView.layer.shadowOpacity = 0.8
        BackView.dropShadow(scale: true)
        
        roundedBTN()
        
    }
    
    
    func roundedBTN() {
        
        BTNEditOutlet.layer.cornerRadius = 10
        BTNEditOutlet.clipsToBounds = true
        
        BTNDeleteOutlet.layer.cornerRadius = 10
        BTNDeleteOutlet.clipsToBounds = true
        
    }
    
}
