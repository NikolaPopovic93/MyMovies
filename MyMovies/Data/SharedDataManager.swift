//
//  DataManager.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/31/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation
import LGSideMenuController

class SharedDataManager {
    
    class var sharedInstance: SharedDataManager {
        struct Static{
            static let instance : SharedDataManager = SharedDataManager()
        }
        return Static.instance
    }
    
    private init() {}
    
    var mainViewController : LGSideMenuController!
    var geners : [Genre]?
    var configuration : Configuration?
    var languages : [Language]?
    var countries : [Country]?
}
