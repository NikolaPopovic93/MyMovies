//
//  Extesions.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/29/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = greenColor.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
    }
}
