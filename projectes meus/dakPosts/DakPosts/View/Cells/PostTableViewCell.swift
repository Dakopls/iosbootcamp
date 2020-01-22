//
//  TableViewCell.swift
//  Christmapps
//
//  Created by user on 08/01/2020.
//  Copyright © 2020 Atlabs. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    static var height: CGFloat = 46 // Ho posem aquí per encapsular aquí. També es pot definir en el TableViewController
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
