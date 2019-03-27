//
//  SimilarMovie.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/2/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class SimilarMoviePage {
    var page : Int64!
    var similarMovies : [Movie]!
    var totalPages : Int64!
    var totalResults : Int64!
    
    init() {
        self.page = 0
        self.similarMovies = [Movie]()
        self.totalPages = 0
        self.totalResults = 0
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.page = dictionary.value(forKey: "page") as? Int64 ?? 0
        
        let similarMovies = dictionary.value(forKey: "results") as? NSArray ?? NSArray()
        for similarMovie in similarMovies {
            let similarMovieModel = Movie()
            similarMovieModel.fromDictionaryMovie(dictionary: similarMovie as? NSDictionary ?? NSDictionary())
            self.similarMovies.append(similarMovieModel)
        }
        
        self.totalPages = dictionary.value(forKey: "total_pages") as? Int64 ?? 0
        self.totalResults = dictionary.value(forKey: "total_results") as? Int64 ?? 0
    }
}
