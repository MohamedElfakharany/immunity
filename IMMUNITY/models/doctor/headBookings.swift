//
//  headBookings.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/5/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//


import Foundation

// MARK: - HeadBookings
struct HeadBookings: Codable {
    let errorFlag: Int?
    let message: String?
    let result: Result?
    
    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct Result: Codable {
    let data: allBooks?
}

// MARK: - DataClass
struct allBooks: Codable {
    let currentPage: Int?
    let data: [SingleBook]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL: String?
    let nextPageURL: JSONNull?
    let path: String?
    let perPage: Int?
    let prevPageURL: JSONNull?
    let to, total: Int?
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - Datum
struct SingleBook: Codable {
    let doctorImage:  JSONNull?
    let firstName, lastName, from, to: String?
    let day, payment, date: String?
    
    enum CodingKeys: String, CodingKey {
        case doctorImage = "doctor_image"
        case firstName = "first_name"
        case lastName = "last_name"
        case from, to, day, payment, date
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
