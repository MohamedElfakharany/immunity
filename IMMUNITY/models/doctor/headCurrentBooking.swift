//
//  headCurrentBooking.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/5/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation

// MARK: - HeadCurrentBookings
struct HeadCurrentBookings: Codable {
    let errorFlag: Int?
    let message: String?
    let result: ResultCurrentBooking?
    
    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct ResultCurrentBooking: Codable {
    let data: allCurrentBook?
}

// MARK: - DataClass
struct allCurrentBook: Codable {
    let id: Int?
    let image: JSONNullCurrentBooking?
    let firstName, lastName, phone, gender: String?
    let dateOfBirth, from, to, day: String?
    let payment, date: String?
    
    enum CodingKeys: String, CodingKey {
        case id, image
        case firstName = "first_name"
        case lastName = "last_name"
        case phone, gender
        case dateOfBirth = "date_of_birth"
        case from, to, day, payment, date
    }
}

// MARK: - Encode/decode helpers

class JSONNullCurrentBooking: Codable, Hashable {
    
    public static func == (lhs: JSONNullCurrentBooking, rhs: JSONNullCurrentBooking) -> Bool {
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

