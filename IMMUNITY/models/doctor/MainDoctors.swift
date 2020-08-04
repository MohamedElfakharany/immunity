//
//  MainDoctors.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/3/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation

// MARK: - HeadDoctor
struct HeadDoctor: Codable {
    let errorFlag: Int?
    let message: String?
    let result: MainDoctors2?
    
    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct MainDoctors2: Codable {
    let total, perPage: Int?
    let doctors: [SingleDoctor2]?
    
    enum CodingKeys: String, CodingKey {
        case total
        case perPage = "per_page"
        case doctors
    }
}

// MARK: - Doctor
struct SingleDoctor2: Codable {
    let id: Int?
    let firstName, lastName: String?
    let image: String?
    let fees, isBusy: String?
    let gender: Gender?
    let rating: Double?
    let specialities: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case image, fees
        case isBusy = "is_busy"
        case gender, rating, specialities
    }
}

enum Gender: String, Codable {
    case female = "FEMALE"
    case male = "MALE"
}
