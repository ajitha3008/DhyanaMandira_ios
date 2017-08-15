//
//  EventsCell.swift
//  DhyanaMandira
//
//  Created by Abilash Cumulations on 14/08/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class EventsCell: UITableViewCell {
    
    @IBOutlet weak var eventDesc: UILabel!
    @IBOutlet weak var dateAndTime: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var baseView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        addShadow()
        
    }
    
    func addShadow()
    {
        baseView.layer.masksToBounds = false;
        baseView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        baseView.layer.shadowRadius = 5;
        baseView.layer.shadowOpacity = 0.5;
        baseView.layer.borderColor = UIColor.darkGray.cgColor;
        baseView.layer.borderWidth = 0.5;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
