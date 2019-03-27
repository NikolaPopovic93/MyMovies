//
//  Discover.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class Discover {
    var language = Language()
    var sortBy : String?
    var releaseYear : String?
    var actors = [String]()
    var rating : Int?
    var genres = [Genre]()
    var runTime = ""
    var region = ""
    var originalLanguage = Language()
    
    init() {
        if let languages = SharedDataManager.sharedInstance.languages {
            for index in languages.indices {
                if languages[index].iso == "en" {
                    self.language = languages[index]
                    self.language.index = index
                }
            }
        }
        self.sortBy = SortBy.PopularityAsc.rawValue
    }
}
