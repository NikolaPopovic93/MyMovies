//
//  Constants.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation
import UIKit

let apiKey = "32557aca40f0df77b8181d6123fd9677"
let movieApi = "https://api.themoviedb.org/3/movie/"
let genersApi = "https://api.themoviedb.org/3/genre/movie/"
let discoverApi = "https://api.themoviedb.org/3/discover/movie?"
let configurationApi = "https://api.themoviedb.org/3/configuration"
let peopleApi = "https://api.themoviedb.org/3/person"


// Discover List
let kGetPopularDiscover = "\(discoverApi)api_key=\(apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=%@&with_genres=%@"
let kGetTopRatedDiscover = "\(discoverApi)api_key=\(apiKey)&language=en-US&sort_by=vote_count.desc&include_adult=false&include_video=false&page=%@&vote_count.gte=50&vote_average.gte=8&with_genres=%@"
// Postaviti 3 meseca unazad za Up Comming
let kGetUpCommingDiscover = "\(discoverApi)api_key=\(apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=%@&primary_release_date.gte=%@&with_genres=%@"


// Get Lists
let kGetPopular = "\(movieApi)popular?api_key=\(apiKey)&language=en-US&page=%@"
let kGetTopRated = "\(movieApi)top_rated?api_key=\(apiKey)&language=en-US&page=%@"
let kGetUpcoming = "\(movieApi)upcoming?api_key=\(apiKey)&language=en-US&page=%@&"
let kGetLatest = "\(movieApi)latest?api_key=\(apiKey)&language=en-US&page=%@"  // Vraca poslednji film koji je dodat na API
let kGetNowPlaying = "\(movieApi)now_playing?api_key=\(apiKey)&language=en-US&page=%@"
let kGetSimilarMovies = "\(movieApi)%@/similar?api_key=\(apiKey)&language=en-US&page=%@"
let kGetVideos = "\(movieApi)%@/videos?api_key=\(apiKey)&language=en-US"


// Proveri da li se negde koriste ove putanje???
let kGetReviews = "\(movieApi)%@/reviews?api_key=%@&language=en-US&page=%@"
let kGetRecommendations = "\(movieApi)%@/recommendations?api_key=\(apiKey)&language=en-US&page=%@"
let kGetExternalIDsPeopele = "\(peopleApi)%@/external_ids?api_key=\(apiKey)&language=en-US"
let kGetExternalIDs = "\(movieApi)%@/external_ids?api_key=\(apiKey)"
let kGetDetails = "\(movieApi)%@?api_key=\(apiKey)&language=en-US"
let kGetCredits = "\(movieApi)%@/credits?api_key=\(apiKey)"


let kGetGeners = "\(genersApi)list?api_key=\(apiKey)&language=en-US"

let kGetLanguages = "\(configurationApi)/languages?api_key=\(apiKey)"
let kGetConfigurations = "\(configurationApi)?api_key=\(apiKey)"

// Get Peoples
let kGetPeople = "\(peopleApi)/%@?api_key=\(apiKey)&language=en-US"
let kGetPeopleCast = "\(peopleApi)/%@/movie_credits?api_key=\(apiKey)&language=en-US"
let kGetPeoplesPopular = "\(peopleApi)/popular?api_key=\(apiKey)&language=en-US&page=%@"
let kGetPeopleSearch = "\(peopleApi)?api_key=\(apiKey)&language=en-US&query=%@&page=%@&include_adult=false"

// Cofiguration
let kGetLanguagesConfiguration = "\(configurationApi)/languages?api_key=\(apiKey)"
let posterPahtBase = "\(SharedDataManager.sharedInstance.configuration!.secureBaseUrl!)\(SharedDataManager.sharedInstance.configuration!.backdropSizes[1])%@"

// Countries
let kGetCountries = "https://restcountries.eu/rest/v2/all"

// Socials
let facebook = "https://www.facebook.com/%@"
let twitter = "https://twitter.com/%@"
let instagram = "https://www.instagram.com/%@"
let imdb = "https://www.imdb.com/name/%@"


// Colors
let greenColor = UIColor(red: 42/255, green: 209/255, blue: 122/255, alpha: 1.0)
let blackBackGroundColor = UIColor(red: 9/255, green: 28/255, blue: 36/255, alpha: 1.0)
let yellowRatingCollor = UIColor(red: 253/255, green: 210/255, blue: 126/255, alpha: 1.0)
