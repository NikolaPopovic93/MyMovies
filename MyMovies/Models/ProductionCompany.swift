//
//  ProductionCompanies.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/2/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class ProductionCompany {
    var logoPath : String!
    var name : String!
    var originCountry : String!
    
    init() {
        self.logoPath = ""
        self.name = ""
        self.originCountry = ""
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.logoPath = Utilities.getValidString(dictionary.value(forKey: "logo_path") as? String, defaultString: "")
        self.name = Utilities.getValidString(dictionary.value(forKey: "name") as? String, defaultString: "")
        self.originCountry = Utilities.getValidString(dictionary.value(forKey: "origin_country") as? String, defaultString: "")
    }
}
