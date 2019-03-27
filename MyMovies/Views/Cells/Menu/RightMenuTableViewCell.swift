//
//  RightMenuTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 2/9/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class RightMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkMark: UIImageView!
    
    var isChecked = false
    var genresId = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
