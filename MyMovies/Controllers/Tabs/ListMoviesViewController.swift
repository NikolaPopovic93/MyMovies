//
//  ListMoviesViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/31/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import UIKit
import LGSideMenuController

enum MovieType {
    case Popular
    case TopRated
    case UpComming
}

class ListMoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var movieImagePopUp: UIImageView!
    @IBOutlet weak var nameLabelPopUp: UILabel!
    @IBOutlet weak var genresLabelPopUp: UILabel!
    @IBOutlet weak var releaseDateLabelPopUp: UILabel!
    @IBOutlet weak var voteLabelPopUp: UILabel!
    @IBOutlet weak var textViewPopUp: UITextView!
    
    public var movieType = MovieType.Popular
    
    private let cellIdentifier = "MovieTableViewCell"
    private let refreshControl = UIRefreshControl()

    private var cinema = Cinema()
    private var genreIDs = [Int]()
    private var genresString = ""
    private var lastIndexPath = IndexPath(row: 0, section: 0)
    private var paging = 1
    private var isFilter = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.isNavigationBarHidden = true
        getMovies()
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.popUpView.isHidden = true
    }
    
    // MARK: Actions
    @IBAction func genresAction(_ sender: UIButton) {
        NavigatinosUtilities.selectRightMenu(vc: self,genreIDs: genreIDs)
    }
    
    @objc func refreshAction () {
        paging = 1
        lastIndexPath = IndexPath(row: 0, section: 0)
        cinema = Cinema()
        refreshControl.endRefreshing()
        if isFilter {
            getDiscover()
        } else {
            getMovies()
        }
    }
    
    @objc func reviewAction(_ button : UIButton) {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: IndexPath(row: button.tag - 1, section: 0)) as! MovieTableViewCell
        cell.isExapnd = true
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    @objc func overlayAction() {
        presentPopUp(should: false)
    }
    
    // MARK: Private Functions
    private func setViews() {
        setTable()
        setPopUpView()
        addGestureForOverlay()
    }
    
    private func setTable() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: cellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: cellIdentifier)
        self.refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
        self.tableView.estimatedRowHeight = 600.0
        self.tableView.tableFooterView = UIView()
    }
    
    private func setPopUpView() {
        self.popUpView.layer.cornerRadius = 15
        self.popUpView.layer.masksToBounds = true
    }
    
    private func addGestureForOverlay() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(overlayAction))
        self.overlayView.addGestureRecognizer(gesture)
    }
    
    private func getMovies() {
        switch movieType {
        case .Popular:
            getPopular()
            break
        case .TopRated:
            getTopRated()
            break
        case .UpComming:
            getUpComming()
            break
        }
    }
    
    private func presentPopUp(should: Bool) {
        self.overlayView.isHidden = !should
        if should {
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 100.0, initialSpringVelocity: 25.0, options: .curveEaseOut, animations: {
                //self.popUpView.transform = .identity
                self.popUpView.isHidden = false
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                //self.popUpView.transform = CGAffineTransform(scaleX: 0, y: 0)
                self.popUpView.isHidden = true
            }, completion: nil)
        }
    }
    
    private func filloutPopUp(movie : Movie) {
        if Utilities.isStringValid(movie.posterPath) {
            movieImagePopUp.sd_setImage(with: URL.init(string: Utilities.getAbsolutPosterPath(imagePath: movie.posterPath)), completed: nil)
        } else {
            movieImagePopUp.image = UIImage(named: "popcorn_icon")
        }
        nameLabelPopUp.text = movie.title
        genresLabelPopUp.text = Utilities.getGenres(genersIds: movie.genresIds)
        releaseDateLabelPopUp.text = "Released:   \(Utilities.convertDate(dateString: movie.releaseDate))"
        voteLabelPopUp.text = "  \(String(describing: movie.voteAverage!))"
        textViewPopUp.text = Utilities.isStringValid(movie.overview) ? movie.overview : "No overview.."
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: Table View Data Source
extension ListMoviesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cinema.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MovieTableViewCell
        cell.movie = cinema.movies[indexPath.row]
        cell.filloutContent()
        return cell
    }
}

// MARK: Table View Delegate
extension ListMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = cinema.movies[indexPath.row]
        NavigatinosUtilities.selectDetailsMovie(vc: self, movieId : movie.id, movieName: movie.title)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if isFilter {
            if lastIndexPath.row == row {
                if row != cinema.totalResults - 1 {
                    getDiscover()
                }
            }
        } else {
            if lastIndexPath.row == row {
                if row != cinema.totalResults - 1 {
                    getMovies()
                }
            }
        }
    }
}

// MARK: API
extension ListMoviesViewController {
    func getPopular() {
        Utilities.startProgress()
        MovieApi.sharedInstance.getPopular(page: paging) { (code, error, response) in
            if error == nil {
                Utilities.stopProgress()
                print(response as Any)
                let responseDictionary = response as! NSDictionary
                self.cinema.nowPlayingFromDictionary(dictionary: responseDictionary)
                self.lastIndexPath.row = self.cinema.movies.count - 1
                self.paging += 1
                DispatchQueue.main.async {
                    self.titleLabel.text = "Popular"
                    self.reloadData()
                }
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
    
    private func getTopRated() {
        Utilities.startProgress()
        MovieApi.sharedInstance.getTopRated(page: paging) { (code, error, response) in
            if error == nil {
                Utilities.stopProgress()
                print(response as Any)
                let responseDictionary = response as! NSDictionary
                self.cinema.nowPlayingFromDictionary(dictionary: responseDictionary)
                self.lastIndexPath.row = self.cinema.movies.count - 1
                self.paging += 1
                DispatchQueue.main.async {
                    self.titleLabel.text = "Top Rated"
                    self.reloadData()
                }
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
    
    private func getUpComming() {
        Utilities.startProgress()
        MovieApi.sharedInstance.getUpcoming(page: paging) { (code, error, response) in
            if error == nil {
                Utilities.stopProgress()
                print(response as Any)
                let responseDictionary = response as! NSDictionary
                self.cinema.nowPlayingFromDictionary(dictionary: responseDictionary)
                self.lastIndexPath.row = self.cinema.movies.count - 1
                self.paging += 1
                DispatchQueue.main.async {
                    self.titleLabel.text = "Up Comming"
                    self.reloadData()
                }
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
    
    private func getDiscover() {
        Utilities.startProgress()
        paging = 1
        MovieApi.sharedInstance.getSeacrchByType(paging: paging, genres: genresString, releaseDate: Utilities.getDateStringForDiscover(), type: movieType) { (code, error, response) in
            if error == nil {
                print(response as Any)
                Utilities.stopProgress()
                let responseDictionary = response as! NSDictionary
                self.cinema.nowPlayingFromDictionary(dictionary: responseDictionary)
                self.lastIndexPath.row = self.cinema.totalResults! - 1
                self.paging += 1
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print(error as Any)
                Utilities.stopProgress()
            }
        }
    }
}

// MARK: - Protocols
extension ListMoviesViewController: GenresDelegate {
    func getGenre(genreIds: [Int]) {
        self.genreIDs = genreIds
        self.genresString = Utilities.getStringGenres(listOfIds: genreIds)
        cinema = Cinema()
        if genreIds.count == 0 {
            isFilter = false
            getMovies()
        } else {
            isFilter = true
            getDiscover()
        }
    }
}
