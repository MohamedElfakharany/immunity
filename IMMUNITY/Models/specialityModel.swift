//
//  specialityModel.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/15/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
struct SpecialityModel {
    let Name : String
    let Id : Int
    let image : UIImage
    init(_Name : String, _id : Int ,  _image : UIImage) {
        Name = _Name
        Id = _id
        image = _image
    }
}
