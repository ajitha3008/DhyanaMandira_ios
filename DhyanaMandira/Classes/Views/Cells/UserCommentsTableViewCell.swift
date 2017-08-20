//
//  UserCommentsTableViewCell.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 17/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class UserCommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var starRatingView: EDStarRating!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var commentsLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!
    
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
    
    func configureRating(rating:Float)
    {
    self.starRatingView.maxRating = 5;
    
    self.starRatingView.starImage = UIImage(named:"star.png");
    self.starRatingView.starHighlightedImage = UIImage(named:"starhighlighted.png");
    self.starRatingView.horizontalMargin = 20;
    self.starRatingView.editable = false;
    self.starRatingView.displayMode = UInt(EDStarRatingDisplayFull);
    self.starRatingView.rating = rating;
    }


}
