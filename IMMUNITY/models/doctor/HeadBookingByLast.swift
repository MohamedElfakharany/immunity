//
//  HeadBookingByLast.swift
//  IMMUNITY
//
//  Created by elfakharany on 8/9/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

import Foundation

// MARK: - HeadBookingByLast
struct HeadBookingByLast: Codable {
    let errorFlag: Int?
    let message: String?
    let result: ResultBookingByLast?
    
    enum CodingKeys: String, CodingKey {
        case errorFlag = "error_flag"
        case message, result
    }
}

// MARK: - Result
struct ResultBookingByLast: Codable {
    let data: allBookingByLast?
}

// MARK: - DataClass
struct allBookingByLast: Codable {
    let currentPage: Int?
    let data: [singleBookingByLast]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL, path: String?
    let perPage, to, total: Int?
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case path
        case perPage = "per_page"
        case to, total
    }
}

// MARK: - Datum
struct singleBookingByLast: Codable {
    let doctorImage: String?
    let firstName, lastName, from, to: String?
    let day, payment, date: String?
    let prescrptionImage: String?
    let note: String?
    
    enum CodingKeys: String, CodingKey {
        case doctorImage = "doctor_image"
        case firstName = "first_name"
        case lastName = "last_name"
        case from, to, day, payment, date
        case prescrptionImage = "prescrption_image"
        case note
    }
}
