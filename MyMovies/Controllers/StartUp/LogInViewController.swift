//
//  ViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/5/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        MovieApi.sharedInstance.getSomething { (response, error, data) in
            if error == nil {
                print(data as Any)
            } else {
                print(error as Any)
            }
        }
        
        // Get Popular
//        MovieApi.sharedInstance.getPopular(language: "en-US", page: 1, region: "rs") { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
        
        // Get Top Rate
//        MovieApi.sharedInstance.getTopRated(language: "", page: 1, region: "rs") { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
        
        // Get Upcoming
//        MovieApi.sharedInstance.getUpcoming(language: "", page: 1, region: "rs") { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
//
        
//        MovieApi.sharedInstance.getNowPlaying(language: "", page: 1, region: "rs") { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//                let dataDicionary = response as! NSDictionary
//                let moviesModel = MoviesModel()
//                moviesModel.nowPlayingFromDictionary(dictionary: dataDicionary)
//            } else {
//                print(error as Any)
//            }
//        }
        
        // Search Movies
//        MovieApi.sharedInstance.searchMovies(language: "", text: "Munje", page: 1, region: "rs", year: 0, releaseYear: 0) { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
        
//        MovieApi.sharedInstance.getReviews(movieId: 297761, page: 2) { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
        
//        MovieApi.sharedInstance.getRecommendations(movieID: 297761, page: 1) { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
        
//        MovieApi.sharedInstance.getExternalIDs(movieID: 297761) { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
        
//        MovieApi.sharedInstance.getDetails(movieID: 297761) { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
        
//        MovieApi.sharedInstance.getCredits(movieID: 297761) { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
        
//        MovieApi.sharedInstance.getGeners { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
        
//        MovieApi.sharedInstance.getDiscover(generID: 53, page: 1) { (code, error, response) in
//            if error == nil {
//                print(response as Any)
//            } else {
//                print(error as Any)
//            }
//        }
    }
}

