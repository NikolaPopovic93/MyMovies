//
//  Gener.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/31/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation


class Genre {
    var id : Int!
    var name : String!
    
    init() {
        self.id = 0
        self.name = ""
    }
    
     func initiWithDictionary(dictionary : NSDictionary) {
        self.id = dictionary.value(forKey: "id") as? Int ?? 0
        self.name = Utilities.getValidString(dictionary.value(forKey: "name") as? String, defaultString: "")
    }
}
