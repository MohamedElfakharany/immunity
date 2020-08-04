//
//  auth.swift
//  IMMUNITY
//
//  Created by elfakharany on 7/31/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation



// MARK: - Auth
struct Auth: Codable {
    let errorFlag: Int?
    let message: String?
    let result: ResultAuth?
    
    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct ResultAuth: Codable {
    let token: String?
}
