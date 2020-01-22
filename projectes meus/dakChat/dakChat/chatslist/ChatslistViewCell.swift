//
//  ChatslistViewCell.swift
//  dakChat
//
//  Created by user on 18/12/2019.
//  Copyright © 2019 dak. All rights reserved.
//

import UIKit

class ChatslistViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var lastMsg: UILabel!
    
    static var height: CGFloat = 76 // Ho posem aquí per encapsular aquí. També es pot definir en el TableViewController
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
