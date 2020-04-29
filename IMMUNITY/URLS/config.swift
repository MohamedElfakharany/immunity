//
//  config.swift
//  IMMUNITY
//
//  Created by elfakharany on 12/2/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

struct URLs {
    
    static let mainPatient = "https://medicalsupport.website/api/person/"
    static let mainDoctors = "https://medicalsupport.website/api/doctors"
    static let mainTickets = "https://medicalsupport.website/api/tickets/"
    
    static let login = mainPatient + "login"
    
    static let register = mainPatient + "register"
    
    static let UpdatePatientData = mainPatient + "UpdatePatientData"
    
    static let UpdatePatientPassword = mainPatient + "UpdatePatientPassword"
    
    static let doctorsAll = mainDoctors + ""
    
    static let DocLogin = mainDoctors + "/login"
    
    static let ticketAll = mainTickets + ""
    
}
