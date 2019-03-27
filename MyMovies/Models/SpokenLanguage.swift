//
//  SpokenLanguage.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/2/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class SpokenLanguage {
    var iso : String!
    var name : String!
    
    init() {
        self.iso = ""
        self.name = ""
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.iso = Utilities.getValidString(dictionary.value(forKey: "iso_639_1") as? String, defaultString: "")
        self.name = Utilities.getValidString(dictionary.value(forKey: "name") as? String, defaultString: "")
    }
}
