//
//  Countries.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/4/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class Country {
    var iso : String = ""
    var name : String = ""
    var imagePath : String = ""
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.name = dictionary.value(forKey: "name") as! String
        self.imagePath = dictionary.value(forKey: "flag") as! String
        self.iso = (dictionary.value(forKey: "alpha2Code") as! String).lowercased()
    }
}
