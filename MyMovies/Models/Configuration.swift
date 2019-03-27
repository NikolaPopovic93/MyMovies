//
//  Configuration.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/2/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class Configuration {
    var baseUrl : String!
    var secureBaseUrl : String!
    var backdropSizes : [String]!
    var logoSizes : [String]!
    var posterSizes : [String]!
    var profileSizes : [String]!
    var stillSizes : [String]!
    var changeKeys : [String]!
    
    init() {
        self.baseUrl = ""
        self.secureBaseUrl = ""
        self.backdropSizes = [String]()
        self.logoSizes = [String]()
        self.posterSizes = [String]()
        self.profileSizes = [String]()
        self.stillSizes = [String]()
        self.changeKeys = [String]()
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.baseUrl = Utilities.getValidString(dictionary.value(forKey: "base_url") as? String, defaultString: "")
        self.secureBaseUrl = Utilities.getValidString(dictionary.value(forKey: "secure_base_url") as? String, defaultString: "")
        
        let backdropArray = dictionary.value(forKey: "backdrop_sizes") as? NSArray ?? NSArray()
        for backdrop in backdropArray {
            self.backdropSizes.append(Utilities.getValidString(backdrop as? String, defaultString: ""))
        }
        
        let logoArray = dictionary.value(forKey: "logo_sizes") as? NSArray ?? NSArray()
        for logo in logoArray {
            self.logoSizes.append(Utilities.getValidString(logo as? String, defaultString: ""))
        }
        
        let posterArray = dictionary.value(forKey: "poster_sizes") as? NSArray ?? NSArray()
        for poster in posterArray {
            self.posterSizes.append(Utilities.getValidString(poster as? String, defaultString: ""))
        }
        
        let profileArray = dictionary.value(forKey: "profile_sizes") as? NSArray ?? NSArray()
        for profile in profileArray {
            self.profileSizes.append(Utilities.getValidString(profile as? String, defaultString: ""))
        }
        
        let stillArray = dictionary.value(forKey: "still_sizes") as? NSArray ?? NSArray()
        for still in stillArray {
            self.stillSizes.append(Utilities.getValidString(still as? String, defaultString: ""))
        }
    }
    
    func initChangeKeyWithDictionary(dictionary : NSDictionary) {
        let changeArray = dictionary.value(forKey: "change_keys") as? NSArray ?? NSArray()
        for change in changeArray {
            self.changeKeys.append(Utilities.getValidString(change as? String, defaultString: ""))
        }
    }
}
