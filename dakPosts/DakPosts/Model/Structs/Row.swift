//
//  Row.swift
//  Christmapps
//
//  Created by user on 09/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

struct Row {
    var title: String
    var value: String
    var bgColor: UIColor = .white
    
    init(title: String,
         value: String,
         bgColor: UIColor = .white) {
        self.title = title
        self.value = value
        self.bgColor = bgColor
    }
}
