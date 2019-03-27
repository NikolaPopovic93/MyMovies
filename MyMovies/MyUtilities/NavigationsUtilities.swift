//
//  NavigationsUtilities.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/31/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation
import UIKit

open class NavigatinosUtilities {
    
    class func selectListMovies(vc : UIViewController, movieType : MovieType) {
        let listMovieVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "listMoviesVC") as! ListMoviesViewController
        listMovieVC.movieType = movieType
        SharedDataManager.sharedInstance.mainViewController.rootViewController = listMovieVC
        SharedDataManager.sharedInstance.mainViewController.hideLeftViewAnimated()
    }
    
    class func selectDetailsMovie(vc : UIViewController, movieId : Int, movieName : String) {
        let detailsMovieVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailsMovieVC") as! DetailsMovieViewController
        detailsMovieVC.movieId = movieId
        detailsMovieVC.movieName = movieName
        vc.navigationController?.pushViewController(detailsMovieVC, animated: true)
    }
    
    class func selectPeople(vc : UIViewController, peopleId : Int, peopleName : String) {
        let peopleVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "peopleVC") as! PeopleViewController
        peopleVC.peopleId = peopleId
        vc.navigationController?.pushViewController(peopleVC, animated: true)
    }
    
    class func selectSearch(vc : UIViewController) {
        let searchVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "searchVC") as! SearchViewController
        SharedDataManager.sharedInstance.mainViewController.rootViewController = searchVC
        SharedDataManager.sharedInstance.mainViewController.hideLeftViewAnimated()
    }
    
    class func selectPeoples(vc : UIViewController) {
        let peoplesVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "peoplesVC") as! PeoplesViewController
        SharedDataManager.sharedInstance.mainViewController.rootViewController = peoplesVC
        SharedDataManager.sharedInstance.mainViewController.hideLeftViewAnimated()
    }
    
    class func selectRightMenu(vc : UIViewController, genreIDs : [Int]) {
        let rightMenuVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "rightMenuVC") as! RightMenuViewController
        rightMenuVC.genres = (SharedDataManager.sharedInstance.geners)!
        rightMenuVC.delegateGenres = vc as? GenresDelegate ?? nil
        rightMenuVC.selectedIds = genreIDs
        SharedDataManager.sharedInstance.mainViewController.rightViewController = rightMenuVC
        SharedDataManager.sharedInstance.mainViewController.showRightViewAnimated()
    }
    
    class func selectDiscover(vc : UIViewController) {
        let discoverVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "discoverVC") as! DiscoverViewController
        SharedDataManager.sharedInstance.mainViewController.rootViewController = discoverVC
        SharedDataManager.sharedInstance.mainViewController.hideLeftViewAnimated()
    }
    
    class func selectLangugage(vc : UIViewController, language : Language) {
        let languageVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "languageVC") as! LanguageViewController
        languageVC.delegate = vc as? LanguageDelegate
        languageVC.selectedLanguage = language
        languageVC.selectedIndexPath = IndexPath(row: language.index, section: 0)
        vc.navigationController?.pushViewController(languageVC, animated: true)
    }
    
    class func selectSortBy(vc : UIViewController, item : String) {
        let sortbyVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "sortbyVC") as! SortByViewController
        sortbyVC.delegate = vc as? SortByDelegate
        sortbyVC.selectedItem = item
        vc.navigationController?.pushViewController(sortbyVC, animated: true)
    }
    
    class func selectRating(vc : UIViewController, rating : Int?) {
        let ratingVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ratingVC") as! RatingViewController
        ratingVC.delegate = vc as? RatingDelegate
        if let rating = rating {
            ratingVC.selectedIndexPath.row = rating
        } else {
            ratingVC.selectedIndexPath.row = 0
        }
        vc.navigationController?.pushViewController(ratingVC, animated: true)
    }
}
