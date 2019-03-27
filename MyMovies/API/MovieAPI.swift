//
//  MovieAPI.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/6/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation

class MovieApi  {
    
    static let sharedInstance = MovieApi()
    typealias responseClouser =  (_ code: Int, _ error:Error?, _ response:Any?) -> Void
    private init() {}
    
    
    private func get(url : String, CompletionHandler:@escaping responseClouser) {
        //let postData = NSData(data: "{}".data(using: String.Encoding.utf8)!)
        
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        //request.httpBody = postData as Data
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            do {
                let anyObj = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                CompletionHandler(0, nil, anyObj)
            } catch {
                CompletionHandler(0, nil, nil)
            }
        }
        dataTask.resume()
    }
    
    private func getMethod(url : String, CompletionHandler:@escaping (_ reponse : URLResponse?, _ error : Error?, _ data : Any?) -> Void) {
        let url = url
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let urlSessionConfiguration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: urlSessionConfiguration)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let anyObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    CompletionHandler(response, nil, anyObject)
                } catch {
                    CompletionHandler(response, error, nil)
                }
            }
        }
        dataTask.resume()
    }
    
    func getSomething(CompletionHandler:@escaping (_ response : URLResponse?, _ error : Error?, _ data : Any?) -> Void) {
        self.getMethod(url: String.init(format: kGetLanguages)) { (response, error, data) in
            CompletionHandler(response, error, data)
        }
    }
    
    // MARK: GET Methos
    func getPopular(page : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetPopular, String(page))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getTopRated(page : Int,  CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetTopRated, String(page))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getUpcoming(page : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetUpcoming, String(page))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getLatest(page : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetLatest,String(page))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getReviews(movieId : Int, page : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetReviews, String(movieId), apiKey, String(page))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getRecommendations(movieID : Int, page : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetRecommendations, String(movieID), String(page))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getExternalIDs(movieID : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetExternalIDs, String(movieID))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getDetails(movieID : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetDetails, String(movieID))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getCredits(movieID : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetCredits, String(movieID))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getGeners(CompletionHandler:@escaping responseClouser) {
        self.get(url: kGetGeners) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getConfiguration(CompletionHandler:@escaping responseClouser) {
        self.get(url: kGetConfigurations) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getSimilarMovies(movieId : Int, page : Int, CompletionHanlder:@escaping responseClouser) {
        self.get(url: String.init(format: kGetSimilarMovies, String(movieId), String(page))) { (code, error, response) in
            CompletionHanlder(code, error, response)
        }
    }
    
    func getVideos(movieId : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetVideos, String(movieId))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getLanguages(CompletionHandler:@escaping responseClouser) {
        self.get(url: kGetLanguages) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getPeople(peopleId : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetPeople, String(peopleId))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getPeopleCast(peopleId : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetPeopleCast, String(peopleId))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getExternalIDsPeople(peopleID : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetExternalIDsPeopele, String(peopleID))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getPeoplesPopular(paging : Int, CompletionHandler:@escaping responseClouser) {
        self.get(url: String.init(format: kGetPeoplesPopular, String(paging))) { (code, error, response) in
            CompletionHandler(code, error, response)
        }
    }
    
    func getSeacrchByType(paging : Int, genres : String, releaseDate : String, type : MovieType, CompletionHandler: @escaping responseClouser) {
        switch type {
        case .Popular:
            self.get(url: String(format: kGetPopularDiscover, String(paging), genres)) { (code, error, response) in
                CompletionHandler(code, error, response)
            }
        case .TopRated:
            self.get(url: String(format: kGetTopRatedDiscover, String(paging), genres)) { (code, error, response) in
                CompletionHandler(code, error, response)
            }
        case .UpComming:
            self.get(url: String(format: kGetUpCommingDiscover, String(paging), releaseDate, genres)) { (code, error, response) in
                CompletionHandler(code, error, response)
            }
        }
    }
    
    // Countries
    func getCountries(ComplationHandler:@escaping responseClouser) {
        self.get(url: kGetCountries) { (code, error, response) in
            ComplationHandler(code, error, response)
        }
    }
}
