//
//  message.swift
//  IMMUNITY
//
//  Created by elfakharany on 5/9/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation

// MARK: - HeadMeassage
struct HeadMessage: Codable {
    let errorFlag: Int?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message
    }
}
