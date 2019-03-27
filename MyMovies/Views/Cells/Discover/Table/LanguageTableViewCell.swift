//
//  LanguageTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/5/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lanugageImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
//    var datePicker = SCPopDatePicker()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setDatePicker()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func filloutContent(language : Language) {
        nameLabel.text = language.englishName
    }
    
    private func setDatePicker() {
//        datePicker.tapToDismiss = true
//        datePicker.datePickerType = SCDatePickerType.date
//        datePicker.showBlur = true
//        datePicker.btnFontColour = UIColor.red
    }
}
