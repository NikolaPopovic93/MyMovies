//
//  PeopleTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/4/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var credit = Credit()
    var viewContorller = DetailsMovieViewController()
    
    let identifier = "PeopleCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
}

extension PeopleTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return credit.cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PeopleCollectionViewCell
        cell.cast = credit.cast[indexPath.row]
        return cell
    }
}

extension PeopleTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let people = credit.cast[indexPath.row]
        NavigatinosUtilities.selectPeople(vc: viewContorller, peopleId: Int(truncatingIfNeeded: people.id), peopleName: people.name)
        print(indexPath.row)
    }
}
