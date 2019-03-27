//
//  Language.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/5/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class Language {
    var iso : String!
    var englishName : String!
    var name : String!
    var index = 0
    
    init() {
        self.iso = ""
        self.englishName = ""
        self.name = ""
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.iso = Utilities.getValidString(dictionary.value(forKey: "iso_639_1") as? String, defaultString: "")
        self.englishName = Utilities.getValidString(dictionary.value(forKey: "english_name") as? String, defaultString: "")
        self.name = Utilities.getValidString(dictionary.value(forKey: "name") as? String, defaultString: "")
    }
}
