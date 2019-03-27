//
//  PeopleViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/5/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import SDWebImage

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var bottomImageConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var peopleImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    var peopleId = 0
    
    private var people = People()
    private var castPeoples = [CastPeople]()
    private var identifiers = [String]()
    private var socials = ExternalIDs()
    
    private let detailsIdentifier = "ProfileDetailsTableViewCell"
    private let moviesIdentifier = "PeopleMoviesTableViewCell"
    private let socialsIdentifier = "SocialTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        identifiers = [detailsIdentifier, moviesIdentifier, socialsIdentifier]
        setTable()
        getPeople()
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private Function
    private func setViews() {
        bottomImageConstraints.constant = peopleImageView.frame.width / 2
        if Utilities.isStringValid(people.profilePath) {
            let imageUrl = Utilities.getAbsolutPosterPath(imagePath: self.people.profilePath)
            backGroundImage.sd_setImage(with: URL.init(string: imageUrl), completed: nil)
            peopleImageView.sd_setImage(with: URL.init(string: imageUrl)) { (image, error, imageChace, url) in
                if let image = image {
                    self.peopleImageView.image = image.resizeImage(1000.0, opaque: true, contentMode: UIView.ContentMode.scaleAspectFit)
                }
            }
        } else {
            peopleImageView.image = people.gender == 1 ? UIImage(named: "female_icon") : UIImage(named: "male_icon")
        }
        peopleImageView.layer.cornerRadius = 5
        peopleImageView.layer.masksToBounds = true
    }
    
    private func setTable() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: detailsIdentifier, bundle: Bundle.main), forCellReuseIdentifier: detailsIdentifier)
        self.tableView.register(UINib.init(nibName: moviesIdentifier, bundle: Bundle.main), forCellReuseIdentifier: moviesIdentifier)
        self.tableView.register(UINib.init(nibName: socialsIdentifier, bundle: Bundle.main), forCellReuseIdentifier: socialsIdentifier)
    }
}

// MARK: - Table View Data Source
extension PeopleViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return identifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = identifiers[indexPath.row]
        
        switch identifier {
        case detailsIdentifier:
            let cell = tableView.dequeueReusableCell(withIdentifier: detailsIdentifier, for: indexPath) as! ProfileDetailsTableViewCell
            cell.topConstaints = Double((peopleImageView.frame.height / 2) + 16)
            cell.people = people
            return cell
        case moviesIdentifier:
            let cell = tableView.dequeueReusableCell(withIdentifier: moviesIdentifier, for: indexPath) as! PeopleMoviesTableViewCell
            cell.castPeoples = castPeoples
            cell.viewContoroller = self
            cell.collectionView.reloadData()
            return cell
        case socialsIdentifier:
            let cell = tableView.dequeueReusableCell(withIdentifier: socialsIdentifier, for: indexPath) as! SocialTableViewCell
            cell.social = self.socials
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Table View Delegate
extension PeopleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - API
extension PeopleViewController {
    private func getPeople() {
        Utilities.startProgress()
        MovieApi.sharedInstance.getPeople(peopleId: peopleId) { (code, error, response) in
            if error == nil {
                print(response as Any)
                self.people.initWithDictionaryDetails(dictionary: response as? NSDictionary ?? NSDictionary())
                self.getPeopleCast()
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
    
    private func getPeopleCast() {
        MovieApi.sharedInstance.getPeopleCast(peopleId: peopleId) { (code, error, response) in
            if error == nil {
                
                print(response as Any)
                let castArray = (response as! NSDictionary).value(forKey: "cast") as? NSArray ?? NSArray()
                for cast in castArray {
                    let castModel = CastPeople()
                    castModel.initWithDictionary(dictionary: cast as? NSDictionary ?? NSDictionary())
                    self.castPeoples.append(castModel)
                }
                self.getExternalIDs()
               
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
    
    private func getExternalIDs() {
        MovieApi.sharedInstance.getExternalIDsPeople(peopleID: peopleId) { (code, error, response) in
            if error == nil {
                Utilities.stopProgress()
                print(response as Any)
                
                self.socials.initWithDictionary(dictionary: response as? NSDictionary ?? NSDictionary())
                
                DispatchQueue.main.async {
                    if Utilities.isStringValid(self.people.biography) {
                        self.noDataLabel.isHidden = true
                        self.setViews()
                        self.tableView.reloadData()
                    } else {
                        self.noDataLabel.isHidden = false
                        self.noDataLabel.text = "No data for '\(String(describing: self.people.name!))'"
                    }
                }
            } else {
                Utilities.stopProgress()
                print(error as Any)
            }
        }
    }
}


