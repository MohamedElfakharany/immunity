//
//  config.swift
//  IMMUNITY
//
//  Created by elfakharany on 12/2/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

struct URLs {
    
    static let mainPatient = "https://medicalsupport.website/api/patient/"
    static let mainDoctors = "https://medicalsupport.website/api/doctors/"
    static let mainTickets = "https://medicalsupport.website/api/tickets/"
    
    static let getDoctor = mainPatient + "get_doctors"
    
    static let getCurrentBooking = mainDoctors + "get_current_booking"
    
    static let getBookings = mainPatient + "get_bookings"
    
    static let getDocProfile = mainDoctors + "get_profile"
    
    static let updateProfile = mainDoctors + "update_profile"
    
    static let getDocBookings = mainDoctors + "get_bookings"
    
    static let getDocTickets = mainDoctors + "get_tickets"
    
    static let addTicket = mainDoctors + "add_ticket"
    
    static let getTicket = mainPatient + "get_tickets"
    
    static let login = mainPatient + "login"
    
    static let register = mainPatient + "register"
    
    static let UpdatePatientData = mainPatient + "UpdatePatientData"
    
    static let UpdatePatientPassword = mainPatient + "UpdatePatientPassword"
    
    static let doctorsAll = mainDoctors + ""
    
    static let DocLogin = mainDoctors + "login"
    
    static let patientBook = mainPatient + "book"
    
    static let ticketAll = mainTickets + ""
    
}
