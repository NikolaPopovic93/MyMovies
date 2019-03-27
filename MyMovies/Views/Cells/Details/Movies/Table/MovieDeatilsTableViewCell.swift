//
//  MovieDeatilsTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/3/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class MovieDeatilsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var overViewTextView: UITextView!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var heightConstraints: NSLayoutConstraint!
    
    var movieDetails : MovieDetails? {
        didSet {
            if let movie = movieDetails {
                genresLabel.text = movie.genres.count > 0 ? movie.getGenres() : "-"
                languageLabel.text = Utilities.isStringValid(movie.originalLanguage) ? Utilities.getEnglishName(iso: movie.originalLanguage) : "-"
                releaseDateLabel.text = Utilities.isStringValid(movie.releaseDate) ? Utilities.convertDate(dateString: movie.releaseDate) : "-"
                runTimeLabel.text = movie.getRunTime()
                overViewTextView.text = Utilities.isStringValid(movie.overview) ? movie.overview : "-"
                heightConstraints.constant = Utilities.getTextViewHeight(textView: overViewTextView)
                voteLabel.text = String(movie.voteAverage)
                voteCountLabel.text = movie.getVoteString()
                popularityLabel.text = movie.getPopularityString()
                statusLabel.text = Utilities.isStringValid(movie.status) ? movie.status : "-"
                budgetLabel.text = movie.getBudgetString()
                revenueLabel.text = movie.getRevenueString()
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
