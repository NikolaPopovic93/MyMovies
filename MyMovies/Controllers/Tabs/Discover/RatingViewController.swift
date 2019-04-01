//
//  RatingViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/11/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

protocol RatingDelegate {
    func getRating(rating : String)
}

class RatingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellIdentifier = "RatingCollectionViewCell"
    private let numberOfRows = 10
    
    public var delegate : RatingDelegate?
    public var selectedIndexPath = IndexPath(row: 0, section: 0)
    public var lastedSelectedIndexPath = IndexPath(row: 0, section: 0)
    public var reloadLatest = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollection()
    }
    
    private func setCollection() {
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: cellIdentifier, bundle: Bundle.main), forCellWithReuseIdentifier: cellIdentifier)
        let width = (collectionView.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: UIButton) {
        delegate?.getRating(rating: String(selectedIndexPath.row + 1))
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func clickRating(button: UIButton) {
        
        if button.tag != lastedSelectedIndexPath.row {
            lastedSelectedIndexPath.row = selectedIndexPath.row
            reloadLatest = true
            collectionView.reloadItems(at: [lastedSelectedIndexPath])
            selectedIndexPath.row = button.tag
            reloadLatest = false
            collectionView.reloadItems(at: [selectedIndexPath])
        }
    }
}

// MARk: - Collection View Data Source
extension RatingViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! RatingCollectionViewCell
        cell.ratingButton.setTitle(String(indexPath.row + 1), for: .normal)
        cell.ratingButton.addTarget(self, action: #selector(clickRating), for: .touchUpInside)
        cell.ratingButton.tag = indexPath.row
        if !reloadLatest {
            cell.ratingButton.backgroundColor = greenColor
            cell.ratingButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            cell.ratingButton.backgroundColor = yellowRatingCollor
            cell.ratingButton.setTitleColor(UIColor.black, for: .normal)
        }
        return cell
    }
}
