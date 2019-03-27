//
//  MainViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 2/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import LGSideMenuController

class MainViewController: LGSideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getGeners()
        SharedDataManager.sharedInstance.mainViewController = self
        navigationController?.isNavigationBarHidden = true
        self.delegate = self
    }
}

// MARK: LGSSideMenuViewController
extension MainViewController: LGSideMenuDelegate {
    func willShowRightView(_ rightView: UIView, sideMenuController: LGSideMenuController) {
        
    }
}

// MARK: API (SharedDataManager)
extension MainViewController {
    private func getGeners() {
        MovieApi.sharedInstance.getGeners { (code, error, response) in
            if error == nil {
                Utilities.stopProgress()
                let geners = (response as! NSDictionary).value(forKey: "genres") as! NSArray
                SharedDataManager.sharedInstance.geners = [Genre]()
                for gener in geners {
                    let generDictionary = (gener as! NSDictionary)
                    let generModel = Genre()
                    generModel.initiWithDictionary(dictionary: generDictionary)
                    SharedDataManager.sharedInstance.geners?.append(generModel)
                }
                self.getConfiguration()
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
    
    private func getConfiguration() {
        MovieApi.sharedInstance.getConfiguration { (code, error, response) in
            if error == nil {
                let configuration = Configuration()
                configuration.initWithDictionary(dictionary: (response as! NSDictionary).value(forKey: "images") as! NSDictionary)
                configuration.initChangeKeyWithDictionary(dictionary: response as! NSDictionary)
                SharedDataManager.sharedInstance.configuration = configuration
                self.getLanguages()
            } else {
                print(error as Any)
            }
        }
    }
    
    private func getLanguages() {
        MovieApi.sharedInstance.getLanguages { (code, error, response) in
            if error == nil {
                SharedDataManager.sharedInstance.languages = [Language]()
                let array = response as? NSArray ?? NSArray()
                for languageDictionary in array {
                    let language = Language()
                    language.initWithDictionary(dictionary: languageDictionary as? NSDictionary ?? NSDictionary())
                    SharedDataManager.sharedInstance.languages?.append(language)
                }
                self.getCountries()
            } else {
                print(error as Any)
            }
        }
    }
    
    private func getCountries() {
        MovieApi.sharedInstance.getCountries { (code, error, response) in
            if error == nil {
                SharedDataManager.sharedInstance.countries = [Country]()
                let countriesArray = response as! NSArray
                for country in countriesArray {
                    let countryDicitionary = country as! NSDictionary
                    let countryModel = Country()
                    countryModel.initWithDictionary(dictionary: countryDicitionary)
                    SharedDataManager.sharedInstance.countries?.append(countryModel)
                }
            } else {
                print(error as Any)
            }
        }
    }
}
