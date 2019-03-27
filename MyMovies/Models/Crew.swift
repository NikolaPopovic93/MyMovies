//
//  Crew.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/3/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class Crew {
    var id : Int64!
    var creditId : Int64!
    var department : String!
    var gender : Int!
    var job : String!
    var name : String!
    var profilePath : String!
    
    init() {
        self.id = 0
        self.creditId = 0
        self.department = ""
        self.gender = 0
        self.job = ""
        self.name = ""
        self.profilePath = ""
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.id = dictionary.value(forKey: "id") as? Int64 ?? 0
        self.creditId = dictionary.value(forKey: "credit_id") as? Int64 ?? 0
        self.department = Utilities.getValidString(dictionary.value(forKey: "department") as? String, defaultString: "")
        self.gender = dictionary.value(forKey: "gender") as? Int ?? 0
        self.job = Utilities.getValidString(dictionary.value(forKey: "job") as? String, defaultString: "")
        self.name = Utilities.getValidString(dictionary.value(forKey: "name") as? String, defaultString: "")
        self.profilePath = Utilities.getValidString(dictionary.value(forKey: "profile_path") as? String, defaultString: "")
    }
}
