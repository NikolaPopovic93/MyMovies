//
//  Review.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/2/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class Review {
    var id : Int!
    var author : String!
    var content : String!
    var url : String!
    
    init() {
        self.id = 0
        self.author = ""
        self.content = ""
        self.url = ""
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.id = dictionary.value(forKey: "id") as? Int ?? 0
        self.author = Utilities.getValidString(dictionary.value(forKey: "author") as? String, defaultString: "")
        self.content = Utilities.getValidString(dictionary.value(forKey: "content") as? String, defaultString: "")
        self.url = Utilities.getValidString(dictionary.value(forKey: "url") as? String, defaultString: "")
    }
}
