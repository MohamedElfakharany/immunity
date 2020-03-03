//
//  DactorData.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/2/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let person = try? newJSONDecoder().decode(Person.self, from: jsonData)

import Foundation

// MARK: - Person
struct Person: Codable {
    var data: [Datum]?
    var links: Links?
    var meta: Meta?
}

// MARK: - Datum
struct Datum: Codable {
    var id: Int?
    var firstName, lastName, email, password: String?
    var phone, city: String?
    var createdAt, updatedAt: AtedAt?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email, password, phone, city
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum AtedAt: String, Codable {
    case the20191118114635 = "2019-11-18 11:46:35"
}

// MARK: - Links
struct Links: Codable {
    var first, last: String?
    var prev: JSONNull?
    var next: String?
}

// MARK: - Meta
struct Meta: Codable {
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
