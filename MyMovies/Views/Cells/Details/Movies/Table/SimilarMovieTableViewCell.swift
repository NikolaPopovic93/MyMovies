//
//  SimilarMovieTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/4/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class SimilarMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionVIew: UICollectionView!
    @IBOutlet weak var overlayLabel: UILabel!
    
    private let identifier = "SimilarMovieCollectionViewCell"
    private var lastIndexPath = IndexPath(row: 0, section: 0)
    
    var similarMoviePage = SimilarMoviePage() {
        didSet {
            lastIndexPath.row = similarMoviePage.similarMovies.count - 1
            overlayLabel.isHidden = similarMoviePage.similarMovies.isEmpty ? false : true
        }
    }
    var viewController = DetailsMovieViewController()
    
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
        self.collectionVIew.dataSource = self
        self.collectionVIew.delegate = self
        self.collectionVIew.register(UINib.init(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let layout = collectionVIew.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionVIew.frame.height, height: collectionVIew.frame.height)
    }
}

extension SimilarMovieTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarMoviePage.similarMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SimilarMovieCollectionViewCell
        cell.movie = similarMoviePage.similarMovies[indexPath.row]
        cell.tag = similarMoviePage.similarMovies[indexPath.row].id
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if lastIndexPath == indexPath {
            // To do reload data..
//            viewController.getSimilarMovies()
//            viewController.reloadSimilarMovies = true
        }
    }
}

extension SimilarMovieTableViewCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        // present film
        let movie = similarMoviePage.similarMovies[indexPath.row]
        NavigatinosUtilities.selectDetailsMovie(vc: viewController, movieId : movie.id, movieName: movie.originalTitle)
    }
}
