//
//  Comment.swift
//  Christmapps
//
//  Created by user on 10/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

struct Comment: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
