//
//  TestTableViewCell.swift
//  MyMovies
//
//  Created by Apple on 3/28/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmDescriptinoLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        //shouldExapndCell(should: selected)
    }
    
    func shouldExapndCell(should : Bool) {
        if should {
            filmDescriptinoLabel.numberOfLines = 0
            filmDescriptinoLabel.sizeToFit()
        } else {
            filmDescriptinoLabel.numberOfLines = 1
        }
    }
    
    func setInit(movie : Movie) {
        self.tag = movie.id
        filmNameLabel.text = "Button"
        filmDescriptinoLabel.text = movie.overview
        
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
            if movie.isExpand {
                self.shouldExapndCell(should: true)
            } else {
                self.shouldExapndCell(should: false)
            }
                self.layoutIfNeeded()
        }, completion: nil)
    }
}
