//
//  PeopleMoviesTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class PeopleMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    var castPeoples = [CastPeople]()
    var viewContoroller = PeopleViewController()
    
    private let identifier = "PeopleMovieCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setCollection() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
}

// MARK: - Collection View Data Source
extension PeopleMoviesTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castPeoples.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PeopleMovieCollectionViewCell
        cell.castPeople = castPeoples[indexPath.row]
        return cell
    }
}

// MARK: - Collection View Delegate
extension PeopleMoviesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cast = castPeoples[indexPath.row]
        NavigatinosUtilities.selectDetailsMovie(vc: viewContoroller, movieId: Int(truncatingIfNeeded: cast.id), movieName: cast.originalTitle)
    }
}
