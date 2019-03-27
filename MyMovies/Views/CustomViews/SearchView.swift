//
//  SearchView.swift
//  MyMovies
//
//  Created by Apple on 3/27/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    private func setViews() {
        let nib = UINib(nibName: "SearchView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        searchButton.layer.cornerRadius = 5
        searchButton.setShadow()
        textField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged(_ textField : UITextField) {
        print(textField.text)
        NotificationCenter.default.post(name: Notification.Name("SEARCH_PEOPELE_NOTIFICATION"), object: nil)
    }
}
