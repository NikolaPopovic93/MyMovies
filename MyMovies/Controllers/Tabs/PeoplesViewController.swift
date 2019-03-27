//
//  PeoplesViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 2/9/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import SVProgressHUD

class PeoplesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var peoples = [People]()
    private var paging = 1
    private var lastIndexPath = IndexPath(row: 0, section: 0)
    
    private let refreshControl = UIRefreshControl()
    private let cellIdntifier = "PeoplesTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        setTable()
        getPeoplesPopular()
    }
    
    // MARK: - Actions
    @objc func refreshAction() {
        paging = 1
        lastIndexPath = IndexPath(row: 0, section: 0)
        peoples = [People]()
        getPeoplesPopular()
        refreshControl.endRefreshing()
    }
    
    private func setTable() {
        tableView.dataSource = self
        tableView.delegate = self
        refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        tableView.refreshControl = refreshControl
        tableView.register(UINib.init(nibName: cellIdntifier, bundle: Bundle.main), forCellReuseIdentifier: cellIdntifier)
    }
}

// MARK: - Table View Data Source
extension PeoplesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdntifier, for: indexPath) as! PeoplesTableViewCell
        let people = peoples[indexPath.row]
        cell.setViews(imagePath: people.profilePath, name: people.name, gender: people.gender)
        return cell
    }
}

// MARK: - Table View Delegate
extension PeoplesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let people = peoples[indexPath.row]
        NavigatinosUtilities.selectPeople(vc: self, peopleId: people.id, peopleName: people.name)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if lastIndexPath.row == row {
            getPeoplesPopular()
        }
    }
}

// MARK: API
extension PeoplesViewController {
    private func getPeoplesPopular() {
        Utilities.startProgress()
        MovieApi.sharedInstance.getPeoplesPopular(paging: paging) { (code, error, response) in
            if error == nil {
                Utilities.stopProgress()
                print(response as Any)
                let dataDictionary = response as! NSDictionary
                let resultsArray = dataDictionary.value(forKey: "results") as? NSArray ?? NSArray()
                for peopleDictionary in resultsArray {
                    let people = People()
                    people.initWithDictionary(dictionary: peopleDictionary as! NSDictionary)
                    self.peoples.append(people)
                }
                self.lastIndexPath.row = self.peoples.count - 1
                self.paging += 1
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
}


