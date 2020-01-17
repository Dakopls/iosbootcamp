//
//  NetworkPostDataProvider.swift
//  Christmapps
//
//  Created by user on 07/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import Foundation

struct NetworkPostDataProvider: PostDataProvider {
    
    var post: Post
    var content = [Section]()
    
    init(post: Post) {
        self.post = post
        let section1 = [
            Row(title: "ID", value: "\(post.id)"),
            Row(title: "ID Usuario", value: String(post.userId)),
            Row(title: "Título", value: post.title),
            Row(title: "Cuerpo", value: post.body),
        ]
        let section2 = [
            Row(title: "ID", value: "\(post.id)", bgColor: .red),
            Row(title: "ID Usuario", value: String(post.userId)),
            Row(title: "Título", value: post.title),
            Row(title: "Cuerpo", value: post.body),
        ]
        let section3 = [
            Row(title: "ID", value: "\(post.id)", bgColor: .red),
            Row(title: "ID Usuario", value: String(post.userId)),
            Row(title: "Título", value: post.title),
            Row(title: "Cuerpo", value: post.body),
        ]
        let section4 = [
            Row(title: "ID", value: "\(post.id)", bgColor: .red),
            Row(title: "ID Usuario", value: String(post.userId)),
            Row(title: "Título", value: post.title),
            Row(title: "Cuerpo", value: post.body),
        ]
        content.append(Section(header: "Titulo 1", footer: "Footer 1", rows: section1))
        content.append(Section(header: "Titulo 2", footer: "Footer 2", rows: section2))
        content.append(Section(header: "Titulo 3", footer: "Footer 3", rows: section3))
        content.append(Section(header: "Titulo 4", footer: "Footer 4", rows: section4))
        
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
}
