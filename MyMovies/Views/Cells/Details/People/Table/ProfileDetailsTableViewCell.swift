//
//  ProfileDetailsTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class ProfileDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var heightTextViewConstraints: NSLayoutConstraint!
    @IBOutlet weak var topNameConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var birthDayLabel: UILabel!
    @IBOutlet weak var birthPlaceLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var biographyTextView: UITextView!
    
    var topConstaints = 0.0
    
    var people : People? {
        didSet {
            if let people = people {
                nameLabel.text = people.name
                departmentLabel.text = people.knownForDepartment
                if Utilities.isStringValid(people.deathDay) {
                    let birthDay = Utilities.convertDate(dateString: people.birthDay)
                    let deathDay = Utilities.convertDate(dateString: people.deathDay)
                    birthDayLabel.text = "\(birthDay) - \(deathDay)"
                } else {
                    birthDayLabel.text = Utilities.convertDate(dateString: people.birthDay)
                }
                birthPlaceLabel.text = people.placeOfBirth
                popularityLabel.text = "Popularity:  \(String(describing: people.popularity!))"
                biographyTextView.text = people.biography
                heightTextViewConstraints.constant = Utilities.getTextViewHeight(textView: biographyTextView) + 60
                topNameConstraints.constant = CGFloat(topConstaints)
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
