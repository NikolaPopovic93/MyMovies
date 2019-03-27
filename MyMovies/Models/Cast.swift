//
//  Credit.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/3/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class Cast {
    var id : Int64!
    var castId : Int64!
    var name : String!
    var character : String!
    var gender : Int!
    var order : Int!
    var profilePath : String!
    
    init() {
        self.id = 0
        self.castId = 0
        self.name = ""
        self.character = ""
        self.gender = 0
        self.order = 0
        self.profilePath = ""
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.id = dictionary.value(forKey: "id") as? Int64 ?? 0
        self.castId = dictionary.value(forKey: "cast_id") as? Int64 ?? 0
        self.character = Utilities.getValidString(dictionary.value(forKey: "character") as? String, defaultString: "")
        self.gender = dictionary.value(forKey: "gender") as? Int ?? 0
        self.name = Utilities.getValidString(dictionary.value(forKey: "name") as? String, defaultString: "")
        self.order = dictionary.value(forKey: "order") as? Int ?? 0
        self.profilePath = Utilities.getValidString(dictionary.value(forKey: "profile_path") as? String, defaultString: "")
    }
}
