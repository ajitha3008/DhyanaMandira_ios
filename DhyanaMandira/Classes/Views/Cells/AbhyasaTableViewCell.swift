//
//  AbhyasaTableViewCell.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 17/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class AbhyasaTableViewCell: UITableViewCell {

    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var avatarInitials: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
 let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
 headerView.backgroundColor = UIColor(rgb: 0xff9933)
 let label = UILabel(frame: CGRect(x: 70, y: 0, width: tableView.frame.size.width, height: 50))
 label.backgroundColor = UIColor.clear
 label.textAlignment = .left
 label.textColor = UIColor(rgb: 0x000000)
 label.text = "< "+sections[section].name
 label.tag = section
 label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
 
 //let tap = UITapGestureRecognizer(target: self, action: #selector(MantrasViewController.tapFunction))
 //headerView.tag = section;
 //label.isUserInteractionEnabled = true
 //headerView.addGestureRecognizer(tap)
 headerView.addSubview(label)
 let icon = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
 icon.backgroundColor = UIColor(rgb: 0xff9933)
 icon.layer.borderWidth = 1
 icon.layer.masksToBounds = false
 icon.layer.borderColor = UIColor(rgb: 0x000000).cgColor
 icon.layer.cornerRadius = icon.frame.height/2
 icon.clipsToBounds = true
*/
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
