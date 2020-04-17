//
//  doctors.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/3/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mainDoctors = try? newJSONDecoder().decode(MainDoctors.self, from: jsonData)

import Foundation

// MARK: - MainDoctors
struct MainDoctors: Codable {
    var data: [SingleDoctor]?
    var links: LinksDoctor?
    var meta: MetaDoctor?
}

// MARK: - SingleDoctor
struct SingleDoctor: Codable {
    var id: Int?
    var firstName, lastName, hospitalName, specialities: String?
    var mobileNumber, phoneNumber, email, password: String?
    var fees, info, city: String?
    var image: String?
    var dateOfBirth, rate, visitorRating, createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case hospitalName = "hospital_name"
        case specialities
        case mobileNumber = "mobile_number"
        case phoneNumber = "phone_number"
        case email, password, fees, info, city, image
        case dateOfBirth = "date_of_birth"
        case rate
        case visitorRating = "visitor_rating"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Links
struct LinksDoctor: Codable {
    var first, last, next: String?
}

// MARK: - Meta
struct MetaDoctor: Codable {
    var currentPage, from, lastPage: Int?
    var path: String?
    var perPage, to, total: Int?
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case path
        case perPage = "per_page"
        case to, total
    }
}
