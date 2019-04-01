//
//  MovieTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/31/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var filmView: UIView!
    
    
    public var movie: Movie?
    public var isExapnd = false
    
    private var defaultTextViewHeight: CGFloat = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func filloutContent() {
        if let movie = movie {
            if Utilities.isStringValid(movie.posterPath) {
                let imageURL = Utilities.getAbsolutPosterPath(imagePath: movie.posterPath)
                movieImageView.sd_setImage(with: URL.init(string: imageURL), completed: nil)
            } else {
                movieImageView.image = UIImage(named: "popcorn_icon")
            }
            movieImageView.layer.cornerRadius = 5
            movieImageView.layer.masksToBounds = true
            nameLabel.text = movie.title
            genresLabel.text = Utilities.getGenres(genersIds: movie.genresIds)
            voteLabel.text = " \(String(describing: movie.voteAverage!))"
            releasedLabel.text = "Released:  \(Utilities.convertDate(dateString: movie.releaseDate))"
            overViewLabel.text = Utilities.isStringValid(movie.overview) ? movie.overview : "No overview..."
            filmView.dropShadow()
            filmView.layer.cornerRadius = 15
        }
    }
}
