//
//  UserCommentsTableViewCell.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 17/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class UserCommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var commentsLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
