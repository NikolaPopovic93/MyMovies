//
//  DetailsMovieViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/2/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import SDWebImage
import YouTubePlayer

class DetailsMovieViewController: UIViewController {

    @IBOutlet weak var imageMovieImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerView: YouTubePlayerView!
    @IBOutlet weak var nameLabel: UILabel!
    
    public var movieId = 0
    public var movieName = ""
    public var reloadSimilarMovies = false
    
    private var movieDetails = MovieDetails()
    private var similarMoviePage = SimilarMoviePage()
    private var video = Video()
    private var credit = Credit()
    
    private let movieDetailsIdentifier = "MovieDeatilsTableViewCell"
    private let peopleIdentifier = "PeopleTableViewCell"
    private let similarMovieIdentifier = "SimilarMovieTableViewCell"
    private var identifiers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        identifiers = [movieDetailsIdentifier, peopleIdentifier, similarMovieIdentifier]
        setTable()
        getVideos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = movieName
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private Functions
    private func setViews() {
        if Utilities.isStringValid(movieDetails.posterPath) {
            let imageURL = Utilities.getAbsolutPosterPath(imagePath: movieDetails.backdropPath)
            imageMovieImageView.sd_setImage(with: URL.init(string: imageURL), completed: nil)
            imageMovieImageView.layer.masksToBounds = true
        } else {
            imageMovieImageView.image = UIImage(named: "popcorn_icon")
        }
        setTable()
        self.playerView.loadVideoID(video.key)
    }
    
    private func setTable() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: movieDetailsIdentifier, bundle: Bundle.main), forCellReuseIdentifier: movieDetailsIdentifier)
        self.tableView.register(UINib.init(nibName: peopleIdentifier, bundle: Bundle.main), forCellReuseIdentifier: peopleIdentifier)
        self.tableView.register(UINib.init(nibName: similarMovieIdentifier, bundle: Bundle.main), forCellReuseIdentifier: similarMovieIdentifier)
    }
}

// MARK: - Table View Data Source
extension DetailsMovieViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return identifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = identifiers[indexPath.row]
        switch identifier {
        case movieDetailsIdentifier:
            let movieDetailsCell = tableView.dequeueReusableCell(withIdentifier: movieDetailsIdentifier) as! MovieDeatilsTableViewCell
            movieDetailsCell.movieDetails = self.movieDetails
            return movieDetailsCell
        case peopleIdentifier:
            let peopleCell = tableView.dequeueReusableCell(withIdentifier: peopleIdentifier) as! PeopleTableViewCell
            peopleCell.credit = self.credit
            peopleCell.viewContorller = self
            peopleCell.collectionView.reloadData()
            return peopleCell
        case similarMovieIdentifier:
            let similarMovieCell = tableView.dequeueReusableCell(withIdentifier: similarMovieIdentifier) as! SimilarMovieTableViewCell
            similarMovieCell.similarMoviePage = self.similarMoviePage
            similarMovieCell.viewController = self
            similarMovieCell.collectionVIew.reloadData()
            return similarMovieCell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Table View Delegate
extension DetailsMovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - API
extension DetailsMovieViewController {
    private func getDiteils() {
        Utilities.startProgress()
        MovieApi.sharedInstance.getDetails(movieID: movieId) { (code, error, response) in
            if error == nil {
                print(response as Any)
                self.movieDetails.initWithDictionary(dictionary: response as! NSDictionary)
                self.getCredits()
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
    
    private func getReviews() {
        MovieApi.sharedInstance.getReviews(movieId: movieId, page: 1) { (code, error, response) in
            if error == nil {
                print(response as Any)
                let reviewPage = ReviewPage()
                reviewPage.initWithDictionary(dictionary: response as! NSDictionary)
            } else {
                print(error as Any)
            }
        }
    }
    
    public func getSimilarMovies() {
        MovieApi.sharedInstance.getSimilarMovies(movieId: movieId, page: 1) { (code, error, response) in
            if error == nil {
                print(response as Any)
                self.similarMoviePage.initWithDictionary(dictionary: response as! NSDictionary)
                DispatchQueue.main.async {
                    if self.reloadSimilarMovies {
                        self.tableView.beginUpdates()
                        self.tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: UITableView.RowAnimation.none)
                        self.reloadSimilarMovies = false
                        self.tableView.endUpdates()
                    } else {
                        self.setViews()
                        self.tableView.reloadData()
                    }
                    Utilities.stopProgress()
                }
            } else {
                print(error as Any)
            }
        }
    }
    
    private func getVideos() {
        MovieApi.sharedInstance.getVideos(movieId: movieId) { (code, error, response) in
            if error == nil {
                print(response as Any)
                let data = response as? NSDictionary ?? NSDictionary()
                let videosArray = data.value(forKey: "results") as? NSArray ?? NSArray()
                let videoDictionary = videosArray.firstObject as? NSDictionary ?? NSDictionary()
                self.video.initWithDictionary(dictinoary: videoDictionary)
                self.getDiteils()
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
    
    private func getCredits() {
        MovieApi.sharedInstance.getCredits(movieID: movieId) { (code, error, response) in
            if error == nil {
                print(response as Any)
                self.credit.initWithDictionary(dictionary: response as? NSDictionary ?? NSDictionary())
                self.getSimilarMovies()
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
}

extension UIImage {
    func resizeImage(_ dimension: CGFloat, opaque: Bool, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImage {
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage
        
        let size = self.size
        let aspectRatio =  size.width/size.height
        
        switch contentMode {
        case .scaleAspectFit:
            if aspectRatio > 1 {                            // Landscape image
                width = dimension
                height = dimension / aspectRatio
            } else {                                        // Portrait image
                height = dimension
                width = dimension * aspectRatio
            }
            
        default:
            fatalError("UIIMage.resizeToFit(): FATAL: Unimplemented ContentMode")
        }
        
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = opaque
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
            newImage = renderer.image {
                (context) in
                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), opaque, 0)
            self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        
        return newImage
    }
}
