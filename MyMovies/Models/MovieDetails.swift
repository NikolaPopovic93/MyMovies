//
//  MovieDetails.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/2/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class MovieDetails {
    var id : Int64!
    var adult : Bool!
    var backdropPath : String!
    var budget : Int64!
    var genres : [Genre]!
    var homePage : String!
    var imbdId : String!
    var originalLanguage : String!
    var originalTitle : String!
    var overview : String!
    var popularity : Double!
    var posterPath : String!
    var productionCompanies : [ProductionCompany]!
    var releaseDate : String!
    var revenue : Int64!
    var runtime : Int64!
    var spokenLanguages : [SpokenLanguage]!
    var status : String!
    var tagline : String!
    var title : String!
    var video : Bool!
    var voteAverage : Double!
    var voteCount : Int64!
    
    init() {
        self.id = 0
        self.adult = false
        self.backdropPath = ""
        self.budget = 0
        self.genres = [Genre]()
        self.homePage = ""
        self.imbdId = ""
        self.originalLanguage = ""
        self.originalTitle = ""
        self.overview = ""
        self.popularity = 0.0
        self.posterPath = ""
        self.productionCompanies = [ProductionCompany]()
        self.releaseDate = ""
        self.revenue = 0
        self.runtime = 0
        self.spokenLanguages = [SpokenLanguage]()
        self.status = ""
        self.tagline = ""
        self.title = ""
        self.video = false
        self.voteAverage = 0.0
        self.voteCount = 0
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.id = dictionary.value(forKey: "id") as? Int64 ?? 0
        self.adult = Utilities.getValidBool(dictionary.value(forKey: "adult") as? Bool, defaultBool: false)
        self.backdropPath = Utilities.getValidString(dictionary.value(forKey: "backdrop_path") as? String, defaultString: "")
        self.budget = dictionary.value(forKey: "budget") as? Int64 ?? 0
        
        let genres = dictionary.value(forKey: "genres") as? NSArray ?? NSArray()
        for genre in genres {
            let genreModel = Genre()
            genreModel.initiWithDictionary(dictionary: genre as? NSDictionary ?? NSDictionary())
            self.genres.append(genreModel)
        }
        
        self.homePage = Utilities.getValidString(dictionary.value(forKey: "homepage") as? String, defaultString: "")
        self.imbdId = Utilities.getValidString(dictionary.value(forKey: "imdb_id") as? String, defaultString: "")
        self.originalLanguage = Utilities.getValidString(dictionary.value(forKey: "original_language") as? String, defaultString: "")
        self.originalTitle = Utilities.getValidString(dictionary.value(forKey: "original_title") as? String, defaultString: "")
        self.overview = Utilities.getValidString(dictionary.value(forKey: "overview") as? String, defaultString: "")
        self.popularity = dictionary.value(forKey: "popularity") as? Double ?? 0.0
        self.posterPath = Utilities.getValidString(dictionary.value(forKey: "poster_path") as? String, defaultString: "")
        
        let productCompanies = dictionary.value(forKey: "production_companies") as? NSArray ?? NSArray()
        for productCompany in productCompanies {
            let productCompanyModel = ProductionCompany()
            productCompanyModel.initWithDictionary(dictionary: productCompany as? NSDictionary ?? NSDictionary())
            self.productionCompanies.append(productCompanyModel)
        }
        
        self.releaseDate = Utilities.getValidString(dictionary.value(forKey: "release_date") as? String, defaultString: "")
        self.revenue = dictionary.value(forKey: "revenue") as? Int64 ?? 0
        self.runtime = dictionary.value(forKey: "runtime") as? Int64 ?? 0
        
        let spokenLanguages = dictionary.value(forKey: "spoken_languages") as? NSArray ?? NSArray()
        for spokenLanguage in spokenLanguages {
            let spokenLanguageModel = SpokenLanguage()
            spokenLanguageModel.initWithDictionary(dictionary: spokenLanguage as? NSDictionary ?? NSDictionary())
            self.spokenLanguages.append(spokenLanguageModel)
        }
        
        self.status = Utilities.getValidString(dictionary.value(forKey: "status") as? String, defaultString: "")
        self.tagline = Utilities.getValidString(dictionary.value(forKey: "tagline") as? String, defaultString: "")
        self.title = Utilities.getValidString(dictionary.value(forKey: "title") as? String, defaultString: "")
        self.video = Utilities.getValidBool(dictionary.value(forKey: "video") as? Bool, defaultBool: false)
        self.voteAverage = dictionary.value(forKey: "vote_average") as? Double ?? 0.0
        self.voteCount = dictionary.value(forKey: "vote_count") as? Int64 ?? 0
    }
    
    func getGenres() -> String {
        var text = ""
        var firstIteration = true
        for genre in self.genres {
            for genreDataManager in SharedDataManager.sharedInstance.geners! {
                if genre.id == genreDataManager.id {
                    if firstIteration {
                        text += "\(String(describing: genreDataManager.name!))"
                        firstIteration = false
                    } else {
                        text += ", \(String(describing: genreDataManager.name!))"
                    }
                }
            }
        }
        return text
    }
    
    func getBudgetString() -> String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        if let budgetString = fmt.string(for: self.budget as Int64) {
            return budgetString + " $"
        } else {
           return ""
        }
    }
    
    func getRevenueString() -> String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        if let revenueString = fmt.string(for: self.revenue as Int64) {
            return revenueString + " $"
        } else {
            return ""
        }
    }
    
    func getVoteString() -> String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        if let voteString = fmt.string(for: self.voteCount as Int64) {
            return voteString
        } else {
            return ""
        }
    }
    
    func getPopularityString() -> String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        if let popularityString = fmt.string(for: self.popularity as Double) {
            return popularityString
        } else {
            return ""
        }
    }
    
    func getRunTime() -> String {
        
        let (h, m) = Utilities.secondsToHoursMinutesSeconds(seconds: Int(truncatingIfNeeded: self.runtime))
        return "\(h)h \(m)m"
    }
}
