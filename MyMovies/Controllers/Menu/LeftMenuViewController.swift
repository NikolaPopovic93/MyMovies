//
//  LeftMenuViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 2/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let numberOfRows = 6
    private let cellIdentifier = "LeftMenuTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: cellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - Table View Data Source
extension LeftMenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LeftMenuTableViewCell
        switch indexPath.row {
        case 0:
            cell.setViews(image: UIImage(named: "popular_icon")!, name: "Popular")
            return cell
        case 1:
            cell.setViews(image: UIImage(named: "top_rated_icon")!, name: "Top rated")
            return cell
        case 2:
            cell.setViews(image: UIImage(named: "upcomming_icon")!, name: "Up Comming")
            return cell
        case 3:
            cell.setViews(image: UIImage(named: "search_icon")!, name: "Search")
            return cell
        case 4:
            cell.setViews(image: UIImage(named: "male_icon")!, name: "People")
            return cell
        case 5:
            cell.setViews(image: UIImage(named: "male_icon")!, name: "Discover")
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Table View Delegate
extension LeftMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            NavigatinosUtilities.selectListMovies(vc: self, movieType: MovieType.Popular)
            break
        case 1:
            NavigatinosUtilities.selectListMovies(vc: self, movieType: MovieType.TopRated)
            break
        case 2:
            NavigatinosUtilities.selectListMovies(vc: self, movieType: MovieType.UpComming)
            break
        case 3:
            NavigatinosUtilities.selectSearch(vc: self)
            break
        case 4:
            NavigatinosUtilities.selectPeoples(vc: self)
            break
        case 5:
            NavigatinosUtilities.selectDiscover(vc: self)
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


