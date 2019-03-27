//
//  PeopleCollectionViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/4/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import SDWebImage

class PeopleCollectionViewCell: UICollectionViewCell {
    
  
    @IBOutlet weak var peopleImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    var cast : Cast? {
        didSet {
            if let cast = cast {
                if Utilities.isStringValid(cast.profilePath) {
                    let imageUrl = Utilities.getAbsolutPosterPath(imagePath: cast.profilePath)
                    print(imageUrl)
                    peopleImageView.sd_setImage(with: URL.init(string: imageUrl), completed: nil)
                } else {
                    peopleImageView.image = cast.gender == 1 ? UIImage(named: "female_icon") : UIImage(named: "male_icon")
                }
                nameLabel.text = cast.name
                characterLabel.text = cast.character
                peopleImageView.layer.cornerRadius = 10
                peopleImageView.layer.masksToBounds = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
