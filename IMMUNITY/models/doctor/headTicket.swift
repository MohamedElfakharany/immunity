//
//  headTicket.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/3/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation

// MARK: - HeadTicket
struct HeadTicket: Codable {
    let errorFlag: Int?
    let message: String?
    let result: MainTickets2?
    
    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct MainTickets2: Codable {
    let tickets: [SingleTicket2]?
}

// MARK: - Ticket
struct SingleTicket2: Codable {
    let id: Int?
    let day,date, from, to, duration: String?
    let availability: String?
}
