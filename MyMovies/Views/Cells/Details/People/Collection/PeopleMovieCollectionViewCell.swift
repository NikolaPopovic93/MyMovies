//
//  PeopleMovieCollectionViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import SDWebImage

class PeopleMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    public var castPeople : CastPeople? {
        didSet{
            if let castPeople = castPeople {
                if Utilities.isStringValid(castPeople.posterPath) {
                    let imageUrl = Utilities.getAbsolutPosterPath(imagePath: castPeople.posterPath)
                    movieImageView.sd_setImage(with: URL.init(string: imageUrl), completed: nil)
                } else {
                    movieImageView.image = UIImage(named: "film_icon")
                }
                nameLabel.text = castPeople.originalTitle
                voteLabel.text = String(castPeople.voteAverage)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
