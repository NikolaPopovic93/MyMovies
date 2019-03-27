//
//  RatingCollectionViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/11/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class RatingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ratingButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setButton()
    }
    
    private func setButton() {
        ratingButton.layer.cornerRadius = ratingButton.frame.width / 2
        ratingButton.layer.borderColor = UIColor.black.cgColor
        ratingButton.layer.borderWidth = 1
    }
}
