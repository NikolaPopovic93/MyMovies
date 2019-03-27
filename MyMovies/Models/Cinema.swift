//
//  MoviesModel.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation

class Cinema {
    var currentPage : Int!
    var totalResults : Int!
    var totalPages : Int!
    var movies : [Movie]!
    
    init() {
        currentPage = 0
        totalResults = 0
        totalPages = 0
        movies = [Movie]()
    }
    
    func nowPlayingFromDictionary (dictionary : NSDictionary) {
        self.currentPage = dictionary.value(forKey: "page") as? Int ?? 0
        self.totalPages = dictionary.value(forKey: "total_pages") as? Int ?? 0
        self.totalResults = dictionary.value(forKey: "total_results") as? Int ?? 0
        let movies = dictionary.value(forKey: "results") as? NSArray ?? NSArray()
        for movie in movies {
            let movieDictionary = movie as! NSDictionary
            let movieModel = Movie()
            movieModel.fromDictionaryMovie(dictionary: movieDictionary)
            self.movies.append(movieModel)
        }
    }
    
    func getMovie(ById id : Int) -> Movie {
        var selectedMovie = Movie()
        for movie in movies {
            if movie.id == id {
                selectedMovie = movie
                break
            }
        }
        return selectedMovie
    }
}
