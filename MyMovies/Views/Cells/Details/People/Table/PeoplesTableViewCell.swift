//
//  PeoplesTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 2/9/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import SDWebImage

class PeoplesTableViewCell: UITableViewCell {

    @IBOutlet weak var peopleImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setViews(imagePath : String, name : String, gender : Int) {
        if Utilities.isStringValid(imagePath) {
            let imageUrl = Utilities.getAbsolutPosterPath(imagePath: imagePath)
            peopleImage.sd_setImage(with: URL.init(string: imageUrl), completed: nil)
        } else {
            peopleImage.image = gender == 1 ? UIImage(named: "female_icon") : UIImage(named: "male_icon")
        }
        nameLabel.text = name
        peopleImage.layer.cornerRadius = 10
        peopleImage.layer.masksToBounds = true
    }
    
}
