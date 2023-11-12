//
//  Review.swift
//  Electrigo
//
//  Created by Aissa Dhia on 12/11/2023.
//

import Foundation
struct Review: Identifiable,Hashable {
    let id = UUID()
    let rating: Int
    let comment: String
}
