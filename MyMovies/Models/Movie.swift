//
//  MovieModel.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation

class Movie {
    var voteCount : Int64!
    var id : Int!
    var video : Bool!
    var voteAverage : Double!
    var title : String!
    var popularity : String!
    var posterPath : String!
    var originalLanguage : String!
    var originalTitle : String!
    var backDropPath : String!
    var adult : Bool!
    var overview : String!
    var releaseDate : String!
    var genresIds : [Int]!
    
    init() {
        self.voteCount = 0
        self.id = 0
        self.video = false
        self.voteAverage = 0.0
        self.title = ""
        self.popularity = ""
        self.posterPath = ""
        self.originalLanguage = ""
        self.originalTitle = ""
        self.backDropPath = ""
        self.adult = false
        self.overview = ""
        self.releaseDate = ""
        self.genresIds = [Int]()
    }
    
    func fromDictionaryMovie(dictionary : NSDictionary) {
        self.voteCount = dictionary.value(forKey: "vote_count") as? Int64 ?? 0
        self.id = dictionary.value(forKey: "id") as? Int ?? 0
        self.video = Utilities.getValidBool(dictionary.value(forKey: "video") as? Bool, defaultBool: false)
        self.voteAverage = dictionary.value(forKey: "vote_average") as? Double ?? 0.0
        self.title = Utilities.getValidString(dictionary.value(forKey: "title") as? String, defaultString: "")
        self.popularity = Utilities.getValidString(dictionary.value(forKey: "popularity") as? String, defaultString: "")
        self.posterPath = Utilities.getValidString(dictionary.value(forKey: "poster_path") as? String, defaultString: "")
        self.originalLanguage = Utilities.getValidString(dictionary.value(forKey: "original_language") as? String, defaultString: "")
        self.originalTitle = Utilities.getValidString(dictionary.value(forKey: "original_title") as? String, defaultString: "")
        self.backDropPath = Utilities.getValidString(dictionary.value(forKey: "backdrop_path") as? String, defaultString: "")
        self.adult = Utilities.getValidBool(dictionary.value(forKey: "adult") as? Bool, defaultBool: false)
        self.overview = Utilities.getValidString(dictionary.value(forKey: "overview") as? String, defaultString: "")
        self.releaseDate = Utilities.getValidString(dictionary.value(forKey: "release_date") as? String, defaultString: "")
        let genresArray = dictionary.value(forKey: "genre_ids") as? NSArray
        if let genresArray = genresArray {
            for genre in genresArray {
                self.genresIds.append(genre as? Int ?? 0)
            }
        }
    }
}
