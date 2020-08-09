//
//  headers.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/5/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation

struct HEADERS {
    
    static let headersPatient = [
        "Accept" : "application/json",
        "APP_KEY" : "123456",
//        "email" : "\(Helper.getPatientEmail() ?? "")",
        "access-token" : "\(Helper.getDoctorAccessToken() ?? "")",
        "email" : "demo@demo.com" 
    ]
    
    static let headersDoctor = [
        "Accept" : "application/json",
        "APP_KEY" : "123456",
        "email" : "\(Helper.getDocEmail() ?? "")",
        "access-token" : "XjZXj6JUWqSCsTagUlvNfG7Qq4dHhUwiwubkGc3J4ZPVC0tmZvbKxmm3bsWrD6ku"
    ]

    
}
