//
//  NetworkContentProvider.swift
//  Christmapps
//
//  Created by user on 09/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import Foundation

protocol DetailContentProvider {
    func sections() -> Int
    func rows(at index: Int) -> Int
    func row(at indexPath: IndexPath) -> Row
    func header(for section: Int) -> String?
    func footer(for section: Int) -> String?
    func title() -> String?
}

struct DetailContent: DetailContentProvider {
    
    var post: Post
    var content: Array<Section> = []
    var comments: Array<Comment> = []
    
    init(post: Post) {
        self.post = post
        let section1 = [
            Row(title: "Post ID", value: String(post.userId)),
            Row(title: "Title", value: post.title),
            Row(title: "Body", value: post.body),
        ]
        self.content.append(Section(header: "", footer: "Post creator ID: " + String(post.userId), rows: section1))
    }
    
    mutating func createComms(comments: Array<Comment>) {
        var counter = 1
        for comment in comments {
            let section = [
                Row(title: "Title", value: String(comment.name)),
                Row(title: "Body", value: String(comment.body)),
            ]
            self.content.append(Section(header: "Comment #" + String(counter), footer: String(comment.email), rows: section))
            counter+=1
        }
    }
    
    func sections() -> Int {
        return content.count
    }
    
    func rows(at index: Int) -> Int {
        return content[index].rows.count
    }
    
    func row(at indexPath: IndexPath) -> Row {
        return content[indexPath.section].rows[indexPath.row]
    }
    
    func header(for section: Int) -> String? {
        return content[section].header
    }
    
    func footer(for section: Int) -> String? {
        return content[section].footer
    }
    
    func title() -> String? {
        if post.title.count > 20 {
            return String(post.title.prefix(20) + "...")
        }
        return post.title
    }
}
