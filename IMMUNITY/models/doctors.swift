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
    var links: Links?
    var meta: Meta?
}

// MARK: - Datum
struct SingleDoctor: Codable {
    var id: Int?
    var firstName, lastName, hospitalName, specialities: String?
    var mobileNumber, phoneNumber, email, password, city: String?
    var fees, info: String?
    var image: String?
    var dateOfBirth, rate, visitorRating: String?
    var createdAt, updatedAt: AtedAt?
    
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


enum AtedAt: String, Codable {
    case the20200128054854 = "2020-01-28 05:48:54"
    case the20200128054855 = "2020-01-28 05:48:55"
    case the20200303193048 = "2020-03-03 19:30:48"
}

// MARK: - Links
struct Links: Codable {
    var first, last: String?
    var prev: JSONNull?
    var next: String?
}

// MARK: - Meta
struct Meta: Codable {
    var currentPage, lastPage: Int?
    var from:Int?
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
