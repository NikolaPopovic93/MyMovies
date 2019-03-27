//
//  LeftMenuTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 2/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class LeftMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var imageTypeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    public func setViews(image : UIImage, name : String) {
        imageTypeImageView.image = image
        nameLabel.text = name
    }
    
}
