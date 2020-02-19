//
//  cityModel.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/15/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
struct cityModel {
    let Name : String
    let Id : Int
    let City_Id : Int
    init(_Name : String, _id : Int, _City_Id : Int) {
        Name = _Name
        Id = _id
        City_Id = _City_Id
    }
}
