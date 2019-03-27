//
//  Video.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/3/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class Video {
    var id : String!
    var isoOne : String!
    var isoTwo : String!
    var key : String!
    var name : String!
    var site : String!
    var size : Int!
    var type : String!
    
    init() {
        self.id = ""
        self.isoOne = ""
        self.isoTwo = ""
        self.key = ""
        self.name = ""
        self.site = ""
        self.size = 0
        self.type = ""
    }
    
    func initWithDictionary(dictinoary : NSDictionary) {
        self.id = Utilities.getValidString(dictinoary.value(forKey: "id") as? String, defaultString: "")
        self.isoOne = Utilities.getValidString(dictinoary.value(forKey: "iso_639_1") as? String, defaultString: "")
        self.isoTwo = Utilities.getValidString(dictinoary.value(forKey: "iso_3166_1") as? String, defaultString: "")
        self.key = Utilities.getValidString(dictinoary.value(forKey: "key") as? String, defaultString: "")
        self.name = Utilities.getValidString(dictinoary.value(forKey: "name") as? String, defaultString: "")
        self.site = Utilities.getValidString(dictinoary.value(forKey: "site") as? String, defaultString: "")
        self.size = dictinoary.value(forKey: "size") as? Int ?? 0
        self.type = Utilities.getValidString(dictinoary.value(forKey: "type") as? String, defaultString: "")
    }
}
