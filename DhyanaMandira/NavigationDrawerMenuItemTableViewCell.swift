//
//  NavigationDrawerMenuItemTableViewCell.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 30/06/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class NavigationDrawerMenuItemTableViewCell: UITableViewCell {

    @IBOutlet weak var MenuItemLabel: UILabel!
    
    @IBOutlet weak var MenuImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
