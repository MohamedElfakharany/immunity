//
//  governmentModel.swift
//  IMMUNITY
//
//  Created by elfakharany on 2/15/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import UIKit
struct governmentModel {
    let Name : String
    let Id : Int
    let Country_Id :Int
    
    init(_Name : String, _id : Int , _Country_Id :Int) {
        Name = _Name
        Id = _id
        Country_Id = _Country_Id
    }
}
