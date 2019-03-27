//
//  ProductCompanyCollectionViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/5/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCompanyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var company : ProductionCompany? {
        didSet {
            if let company = company {
                if Utilities.isStringValid(company.logoPath) {
                    let imageUrl = Utilities.getAbsolutPosterPath(imagePath: company.logoPath)
                    imageImageView.sd_setImage(with: URL.init(string: imageUrl), completed: nil)
                } else {
                    imageImageView.image = UIImage(named: "movie_projector")
                }
                nameLabel.text = company.name
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
