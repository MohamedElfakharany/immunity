//
//  message.swift
//  IMMUNITY
//
//  Created by elfakharany on 5/9/20.
//  Copyright © 2020 Mohamed Elfakharany. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let message = try? newJSONDecoder().decode(Message.self, from: jsonData)

import Foundation

// MARK: - Message
struct Message: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let statue: Bool
}
