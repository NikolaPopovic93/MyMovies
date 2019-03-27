//
//  SortByViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/6/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

protocol SortByDelegate {
    func selectedItem(item : String)
}

class SortByViewController: UIViewController {
    
    private let identifier = "SelectLanguageTableViewCell"
    
    public var selectedItem = ""
    
    public var delegate : SortByDelegate?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTable()
    }
    
    private func setTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }
    
    
    // MARK: - Actions
    @IBAction func backButton(_ sender: UIButton) {
        self.delegate?.selectedItem(item: selectedItem)
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: Table View Data Source
extension SortByViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SortBy.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SelectLanguageTableViewCell
        let item = SortBy.allCases[indexPath.row].rawValue
        let index = item.index(of: " ")!
        let textForLabel = String(item[index...]).trimmingCharacters(in: .whitespacesAndNewlines)
        
        cell.checkMarkIcon.isHidden = item == selectedItem ? false : true
        cell.nameLabel.text = textForLabel
        return cell
    }
}

// MARK: Table View Delegate
extension SortByViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = SortBy.allCases[indexPath.row].rawValue
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
