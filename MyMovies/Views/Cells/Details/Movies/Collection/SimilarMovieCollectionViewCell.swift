//
//  SimilarMovieCollectionViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/4/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import SDWebImage

class SimilarMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var filmImageImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    var movie : Movie? {
        didSet {
            if let movie = movie {
                if Utilities.isStringValid(movie.posterPath) {
                    let imageUrl = Utilities.getAbsolutPosterPath(imagePath: movie.posterPath)
                    filmImageImageView.sd_setImage(with: URL.init(string: imageUrl), completed: nil)
                } else {
                    filmImageImageView.image = UIImage(named: "film_icon")
                }
                filmImageImageView.layer.cornerRadius = 10
                filmImageImageView.layer.masksToBounds = true
                nameLabel.text = movie.originalTitle
                voteLabel.text = "Vote:   \(movie.voteAverage!)"
            } else {
                // TODO..
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
