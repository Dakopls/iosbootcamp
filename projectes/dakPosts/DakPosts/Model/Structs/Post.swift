//
//  Post.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(Int.self, forKey: .userId)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = (try container.decode(String.self, forKey: .title)).uppercaseFirst
        self.body = (try container.decode(String.self, forKey: .body)).uppercaseFirst
    }
}
