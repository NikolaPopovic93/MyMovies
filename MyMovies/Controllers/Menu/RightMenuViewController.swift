//
//  RightMenuViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 2/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit
import LGSideMenuController

protocol GenresDelegate {
    func getGenre(genreIds : [Int])
}

class RightMenuViewController: LGSideMenuController {

    @IBOutlet weak var genreTableView: UITableView!
    
    private let cellIdentifier = "RightMenuTableViewCell"
    
    private var genresIDs = [Int]()
    
    public var selectedId = 0
    public var genres = [Genre]()
    public var delegateGenres : GenresDelegate?
    public var selectedIds = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createGenerIdArray()
        setTable()
        self.delegate = self
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        delegateGenres?.getGenre(genreIds: selectedIds)
        SharedDataManager.sharedInstance.mainViewController.hideRightViewAnimated()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    private func setTable() {
        genreTableView.dataSource = self
        genreTableView.delegate = self
        genreTableView.register(UINib.init(nibName: cellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: cellIdentifier)
    }
    
    private func createGenerIdArray() {
        for genre in genres {
            genresIDs.append(genre.id!)
        }
    }
}

extension RightMenuViewController: LGSideMenuDelegate {
    func willHideRightView(_ rightView: UIView, sideMenuController: LGSideMenuController) {
        
    }
}

// MARK: - Table View Data Source
extension RightMenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RightMenuTableViewCell
        let genre = genres[indexPath.row]
        cell.nameLabel.text = genre.name!
        cell.tag = genre.id!
        cell.checkMark.isHidden = selectedIds.contains(cell.tag) ? false : true
        return cell
    }
}

// MARK: - Table View Delegate
extension RightMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let genre = genres[indexPath.row]
        
        if selectedIds.contains(genre.id!) {
            for index in selectedIds.indices {
                if selectedIds[index] == genre.id! {
                    selectedIds.remove(at: index)
                    break
                }
            }
        } else {
            selectedIds.append(genre.id!)
        }

        genreTableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
