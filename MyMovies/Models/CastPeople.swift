//
//  CastPeople.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class CastPeople {
    var id : Int64!
    var character : String!
    var credit_id : String!
    var releaseDate : String!
    var voteCount : Int64!
    var video : Bool!
    var adult : Bool!
    var voteAverage : Double!
    var title : String!
    var genreIds : [Int]!
    var originalLanguage : String!
    var originalTitle : String!
    var popularity : Double!
    var backdropPath : String!
    var overview : String!
    var posterPath : String!
    
    init() {
        self.id = 0
        self.character = ""
        self.credit_id = ""
        self.releaseDate = ""
        self.voteCount = 0
        self.video = false
        self.adult = false
        self.voteAverage = 0.0
        self.title = ""
        self.genreIds = [Int]()
        self.originalLanguage = ""
        self.originalTitle = ""
        self.popularity = 0.0
        self.backdropPath = ""
        self.overview = ""
        self.posterPath = ""
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.id = dictionary.value(forKey: "id") as? Int64 ?? 0
        self.character = Utilities.getValidString(dictionary.value(forKey: "character") as? String, defaultString: "")
        self.credit_id = Utilities.getValidString(dictionary.value(forKey: "credit_id") as? String, defaultString: "")
        self.releaseDate = Utilities.getValidString(dictionary.value(forKey: "release_date") as? String, defaultString: "")
        self.voteCount = dictionary.value(forKey: "vote_count") as? Int64 ?? 0
        self.video = Utilities.getValidBool(dictionary.value(forKey: "video") as? Bool, defaultBool: false)
        self.adult = Utilities.getValidBool(dictionary.value(forKey: "adult") as? Bool, defaultBool: false)
        self.voteAverage = dictionary.value(forKey: "vote_average") as? Double ?? 0.0
        self.title = Utilities.getValidString(dictionary.value(forKey: "title") as? String, defaultString: "")
        
        let ids = dictionary.value(forKey: "genre_ids") as? NSArray ?? NSArray()
        for id in ids {
            genreIds.append(id as? Int ?? 0)
        }
        
        self.originalLanguage = Utilities.getValidString(dictionary.value(forKey: "original_language") as? String, defaultString: "")
        self.originalTitle = Utilities.getValidString(dictionary.value(forKey: "original_title") as? String, defaultString: "")
        self.popularity = dictionary.value(forKey: "popularity") as? Double ?? 0.0
        self.backdropPath = Utilities.getValidString(dictionary.value(forKey: "backdrop_path") as? String, defaultString: "")
        self.overview = Utilities.getValidString(dictionary.value(forKey: "overview") as? String, defaultString: "")
        self.posterPath = Utilities.getValidString(dictionary.value(forKey: "poster_path") as? String, defaultString: "")
    }
}




