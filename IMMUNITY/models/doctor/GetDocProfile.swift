//
//  GetDocProfile.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/6/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation

// MARK: - GetDocProfile
struct GetDocProfile: Codable {
    let errorFlag: Int?
    let message: String?
    let result: ResultDocProfile?
    
    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct ResultDocProfile: Codable {
    let rate: JSONNullDocProfile?
    let profile: DocProfile?
}

// MARK: - Profile
struct DocProfile: Codable {
    let id: Int?
    let firstName, lastName, hospitalName, specialities: String?
    let mobileNumber, phoneNumber, email, info: String?
    let city: String?
    let image: String?
    let fees, walletBalance, rate, visitorRating: String?
    let isBusy, isApproved, dateOfBirth, gender: String?
    let status, rememberToken, createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case hospitalName = "hospital_name"
        case specialities
        case mobileNumber = "mobile_number"
        case phoneNumber = "phone_number"
        case email, info, city, image, fees
        case walletBalance = "wallet_balance"
        case rate
        case visitorRating = "visitor_rating"
        case isBusy = "is_busy"
        case isApproved = "is_approved"
        case dateOfBirth = "date_of_birth"
        case gender, status
        case rememberToken = "remember_token"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Encode/decode helpers

class JSONNullDocProfile: Codable, Hashable {
    
    public static func == (lhs: JSONNullDocProfile, rhs: JSONNullDocProfile) -> Bool {
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
