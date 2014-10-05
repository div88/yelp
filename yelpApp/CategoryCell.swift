//
//  CategoryCell.swift
//  yelpApp
//
//  Created by Divya Prabhakar on 10/4/14.
//  Copyright (c) 2014 Divya_Prabhakar. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var posterViewImage: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var businessCategoryLabel: UILabel!
    @IBOutlet weak var businessAddressLabel: UILabel!
    @IBOutlet weak var businessReviewLabel: UILabel!
    @IBOutlet weak var businessLabel: UILabel!
    
    @IBOutlet weak var reviewImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
