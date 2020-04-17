//
//  tickets.swift
//  IMMUNITY
//
//  Created by elfakharany on 3/30/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mainTicket = try? newJSONDecoder().decode(MainTicket.self, from: jsonData)

import Foundation

// MARK: - MainTicket
struct MainTicket: Codable {
    var data: [SingleTicket]?
    var links: LinksTicket?
    var meta: MetaTicket?
}

// MARK: - SingleTicket
struct SingleTicket: Codable {
    var id: Int?
    var day, date, duration, time: String?
    var availability, docID, patientID, pharmacyID: String?
    var lapID, docName, medicalReport, listDrugs: String?
    var createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, day, date, duration, time, availability
        case docID = "doc_id"
        case patientID = "patient_id"
        case pharmacyID = "pharmacy_id"
        case lapID = "lap_id"
        case docName = "doc_name"
        case medicalReport = "medical_report"
        case listDrugs
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Links
struct LinksTicket: Codable {
    var first, last, next: String?
}

// MARK: - Meta
struct MetaTicket: Codable {
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
