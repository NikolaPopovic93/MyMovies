//
//  ReviewPage.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/2/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class ReviewPage {
    var id : Int64!
    var page : Int64!
    var reviews : [Review]!
    var totalPages : Int64!
    var totalResults : Int64!
    
    init() {
        self.id = 0
        self.page = 0
        self.reviews = [Review]()
        self.totalPages = 0
        self.totalResults = 0
    }
    
    func initWithDictionary(dictionary : NSDictionary) {
        self.id = dictionary.value(forKey: "id") as? Int64 ?? 0
        self.page = dictionary.value(forKey: "page") as? Int64 ?? 0
        
        let reviews = dictionary.value(forKey: "results") as? NSArray ?? NSArray()
        for review in reviews {
            let reviewModel = Review()
            reviewModel.initWithDictionary(dictionary: review as? NSDictionary ?? NSDictionary())
            self.reviews.append(reviewModel)
        }
        
        self.totalResults = dictionary.value(forKey: "total_pages") as? Int64 ?? 0
        self.totalResults = dictionary.value(forKey: "total_results") as? Int64 ?? 0
    }
}
