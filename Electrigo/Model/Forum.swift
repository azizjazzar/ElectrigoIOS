//
//  Forum.swift
//  Electrigo
//
//  Created by idriss EB on 5/11/2023.
//

import Foundation

struct User {
    var username: String
    var userImageName: String
}

struct Comment {
    var text: String
    // ...
}

struct Post {
    var user: User
    var description: String
    var date: String
    var category: String
    var comments: [Comment]
    // ...
}
