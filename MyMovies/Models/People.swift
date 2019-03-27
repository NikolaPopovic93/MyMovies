//
//  People.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/5/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class People {
    var id : Int!
    var birthDay : String!
    var knownForDepartment : String!
    var deathDay : String
    var name : String!
    var gender : Int!
    var biography : String!
    var popularity : Double!
    var placeOfBirth : String!
    var profilePath : String!
    var adult : Bool!
    var imbdId : String!
    var homePage : String!

    init() {
        self.id = 0
        self.birthDay = ""
        self.knownForDepartment = ""
        self.deathDay = ""
        self.name = ""
        self.gender = 0
        self.biography = ""
        self.popularity = 0.0
        self.placeOfBirth = ""
        self.profilePath = ""
        self.adult = false
        self.imbdId = ""
        self.homePage = ""
    }
    
    func initWithDictionaryDetails(dictionary : NSDictionary) {
        self.id = dictionary.value(forKey: "id") as? Int ?? 0
        self.birthDay = Utilities.getValidString(dictionary.value(forKey: "birthday") as? String, defaultString: "")
        self.knownForDepartment = Utilities.getValidString(dictionary.value(forKey: "known_for_department") as? String, defaultString: "")
        self.deathDay = Utilities.getValidString(dictionary.value(forKey: "deathday") as? String, defaultString: "")
        self.name = Utilities.getValidString(dictionary.value(forKey: "name") as? String, defaultString: "")
        self.gender = dictionary.value(forKey: "gender") as? Int ?? 0
        self.biography = Utilities.getValidString(dictionary.value(forKey: "biography") as? String, defaultString: "")
        self.popularity = dictionary.value(forKey: "popularity") as? Double ?? 0.0
        self.placeOfBirth = Utilities.getValidString(dictionary.value(forKey: "place_of_birth") as? String, defaultString: "")
        self.profilePath = Utilities.getValidString(dictionary.value(forKey: "profile_path") as? String, defaultString: "")
        self.adult = Utilities.getValidBool(dictionary.value(forKey: "adult") as? Bool, defaultBool: false)
        self.imbdId = Utilities.getValidString(dictionary.value(forKey: "imdb_id") as? String, defaultString: "")
        self.homePage = Utilities.getValidString(dictionary.value(forKey: "homepage") as? String, defaultString: "")
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.id = dictionary.value(forKey: "id") as? Int ?? 0
        self.name = Utilities.getValidString(dictionary.value(forKey: "name") as? String, defaultString: "")
        self.profilePath = Utilities.getValidString(dictionary.value(forKey: "profile_path") as? String, defaultString: "")
        self.placeOfBirth = Utilities.getValidString(dictionary.value(forKey: "place_of_birth") as? String, defaultString: "")
        self.birthDay = Utilities.getValidString(dictionary.value(forKey: "birthday") as? String, defaultString: "")
        self.gender = dictionary.value(forKey: "gender") as? Int ?? 0
    }
}
