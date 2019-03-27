//
//  DiscoverViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/5/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

enum SortBy: String, CaseIterable {
    case PopularityAsc = "popularity.asc, Popularity    Asc"
    case PopularityDesc = "popularity.desc, Popularity     Desc"
    case ReleaseDateAsc = "release_date.asc, Release Date    Asc"
    case ReleaseDateDesc = "release_date.desc, Release Date    Desc"
    case RevenueAsc = "revenue.asc, Revenue    Asc"
    case RevenueDesc = "revenue.desc, Revenue    Desc"
    case PrimaryReleaseDateAsc = "primary_release_date.asc, Primary Release Date    Asc"
    case PrimaryReleaseDateDesc = "primary_release_date.desc, Primary Release Date    Desc"
    case OriginalTitleAsc = "original_title.asc, Original Title    Asc"
    case OriginalTitleDesc = "original_title.desc, Original Title    Desc"
    case VoteAverageAsc = "vote_average.asc, Vote Average    Asc"
    case VoteAverageDesc = "vote_average.desc, Vote Average    Desc"
    case VoteCountAsc = "vote_count.asc, Vote Count    Asc"
    case VoteCountDesc = "vote_count.desc, Vote Count    Desc"
}

class DiscoverViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let languageIdentifier = "LanguageTableViewCell"
    private let ratingIdentifier = "RatingTableViewCell"

    private var discover = Discover()
    private var identifiers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        identifiers = [languageIdentifier, languageIdentifier, languageIdentifier, ratingIdentifier]
        setViews()
    }
    
    private func setViews() {
        setTable()
    }
    
    private func setTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: languageIdentifier, bundle: Bundle.main), forCellReuseIdentifier: languageIdentifier)
        tableView.register(UINib.init(nibName: ratingIdentifier, bundle: Bundle.main), forCellReuseIdentifier: ratingIdentifier)
    }
}

// MARK: - Table View Data Source
extension DiscoverViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return identifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: languageIdentifier, for: indexPath) as! LanguageTableViewCell
            cell.filloutContent(language: discover.language)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: languageIdentifier, for: indexPath) as! LanguageTableViewCell
            cell.titleLabel.text = "Sort By"
            if let sortBy = discover.sortBy {
                let index = sortBy.index(of: " ")!
                let textForLabel = String(sortBy[index...]).trimmingCharacters(in: .whitespacesAndNewlines)
                cell.nameLabel.text = textForLabel
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: languageIdentifier, for: indexPath) as! LanguageTableViewCell
            cell.titleLabel.text = "Release Year"
            cell.datePicker.delegate = self
            if let date = discover.releaseYear {
                cell.nameLabel.text = date
            } else {
                cell.nameLabel.text = "No Date"
            }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ratingIdentifier, for: indexPath) as! RatingTableViewCell
            if let rating = discover.rating {
                cell.ratingLabel.text = String("\(rating).0")
            } else {
                cell.ratingLabel.text = "No Rating"
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Table View Delegate
extension DiscoverViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        switch row {
        case 0:
            NavigatinosUtilities.selectLangugage(vc: self, language: discover.language)
        case 1:
            NavigatinosUtilities.selectSortBy(vc: self, item: discover.sortBy!)
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: languageIdentifier, for: indexPath) as! LanguageTableViewCell
            cell.datePicker.show(attachToView: self.view)
            break
        case 3:
            NavigatinosUtilities.selectRating(vc: self, rating: discover.rating)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - Protocols
extension DiscoverViewController: LanguageDelegate, SortByDelegate, RatingDelegate {
    func selectedLanguage(language: Language) {
        discover.language = language
        tableView.reloadData()
    }
    
    func selectedItem(item: String) {
        discover.sortBy = item
        tableView.reloadData()
    }
    
    func getRating(rating: String) {
        discover.rating = Int(rating)!
        tableView.reloadData()
    }
}

// MARK: - Date Picker
extension DiscoverViewController: SCPopDatePickerDelegate {
    func scPopDatePickerDidSelectDate(_ date: Date) {
        print(date)
    }
}
