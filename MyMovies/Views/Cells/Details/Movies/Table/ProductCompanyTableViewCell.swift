//
//  ProductCompanyTableViewCell.swift
//  MyMovies
//
//  Created by Nikola Popovic on 1/5/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class ProductCompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    public var companies = [ProductionCompany]()
    
    private let identifier = "ProductCompanyCollectionViewCell"
    
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
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: self.frame.height, height: self.frame.height)
    }
}

// MARK: Collection View Data Source
extension ProductCompanyTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCompanyCollectionViewCell
        cell.company = companies[indexPath.row]
        return cell
    }
}

// MARK: Collection View Delegate
extension ProductCompanyTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
