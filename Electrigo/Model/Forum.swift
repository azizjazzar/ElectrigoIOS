//
//  Forum.swift
//  Electrigo
//
//  Created by idriss EB on 5/11/2023.
//

import Foundation

struct Forum : Identifiable {
    let id = UUID()
    let authorName: String
    let authorUsername: String
    let timestampText: String
    let text: String
    let numberOfReplies: Int
    let numberOfRetweets: Int
    let numberOfLikes: Int
}
