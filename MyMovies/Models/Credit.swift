//
//  CreditsPage.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/3/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import Foundation

class Credit {
    var id : Int64!
    var cast : [Cast]!
    var crew : [Crew]!
    
    init() {
        self.id = 0
        self.cast = [Cast]()
        self.crew = [Crew]()
    }
    
    func initWithDictionary(dictionary : NSDictionary)  {
        self.id = dictionary.value(forKey: "id") as? Int64 ?? 0
        
        let casts = dictionary.value(forKey: "cast") as? NSArray ?? NSArray()
        for singleCast in casts {
            let castModel = Cast()
            castModel.initWithDictionary(dictionary: singleCast as? NSDictionary ?? NSDictionary())
            self.cast.append(castModel)
        }
        
        let crew = dictionary.value(forKey: "crew") as? NSArray ?? NSArray()
        for singleCrew in crew {
            let crewModel = Crew()
            crewModel.initWithDictionary(dictionary: singleCrew as? NSDictionary ?? NSDictionary())
            self.crew.append(crewModel)
        }
    }
}

