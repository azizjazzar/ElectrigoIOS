//
//  Message.swift
//  Electrigo
//
//  Created by hamza farhani on 8/11/2023.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
