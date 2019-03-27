//
//  Extensions.swift
//  MyMovies
//
//  Created by Apple on 3/27/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
    }
}
