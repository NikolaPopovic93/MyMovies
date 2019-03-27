//
//  ExternalIDs.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/9/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class ExternalIDs {

    var imdbId : String!
    var facebookId : String!
    var instagramId : String!
    var twitterId : String!
    var ids : NSMutableDictionary!
    
    init() {
        self.imdbId = ""
        self.facebookId = ""
        self.instagramId = ""
        self.twitterId = ""
        self.ids = NSMutableDictionary()
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.imdbId = Utilities.getValidString(dictionary.value(forKey: "imdb_id") as? String, defaultString: "")
        self.facebookId = Utilities.getValidString(dictionary.value(forKey: "facebook_id") as? String, defaultString: "")
        self.instagramId = Utilities.getValidString(dictionary.value(forKey: "instagram_id") as? String, defaultString: "")
        self.twitterId = Utilities.getValidString(dictionary.value(forKey: "twitter_id") as? String, defaultString: "")
        let mutableDictionary = NSMutableDictionary()
        if Utilities.isStringValid(self.facebookId) {
            mutableDictionary.setValue(self.facebookId, forKey: "facbookId")
        }
        if Utilities.isStringValid(self.instagramId) {
            self.ids.setValue(self.instagramId, forKey: "instagramId")
        }
        if Utilities.isStringValid(self.twitterId) {
            self.ids.setValue(self.twitterId, forKey: "twitterId")
        }
        if Utilities.isStringValid(self.imdbId) {
            self.ids.setValue(self.imdbId, forKey: "imdbId")
        }
    }
}
