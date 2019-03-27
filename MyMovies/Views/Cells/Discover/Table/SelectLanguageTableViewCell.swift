//
//  SelectLanguageTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/5/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import SDWebImage

class SelectLanguageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var checkMarkIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func filloutContent(language : Language) {
        nameLabel.text = language.englishName
        flagImage.sd_setImage(with: URL.init(string: Utilities.getCountryImagePath(iso: language.iso)), completed: nil)
    }
    
   
}
