//
//  LanguageViewController.swift
//  MyMovies
//
//  Created by Nikola Popovic on 3/5/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

protocol LanguageDelegate {
    func selectedLanguage(language : Language)
}

class LanguageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let identifier = "SelectLanguageTableViewCell"
    
    public var selectedIndexPath = IndexPath(row: 0, section: 0)
    public var delegate : LanguageDelegate?
    public var selectedLanguage = Language()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.scrollToRow(at: selectedIndexPath, at: .middle, animated: false)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.delegate?.selectedLanguage(language: selectedLanguage)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }
}

// MARK: - Table View Data Source
extension LanguageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let languages = SharedDataManager.sharedInstance.languages {
            return languages.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SelectLanguageTableViewCell
        if let languages = SharedDataManager.sharedInstance.languages {
            cell.filloutContent(language: languages[indexPath.row])
            cell.checkMarkIcon.isHidden = languages[indexPath.row].iso == selectedLanguage.iso ? false : true
        }
        return cell
    }
}

// MARK: - Table View Deleage
extension LanguageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let languages = SharedDataManager.sharedInstance.languages {
            let language = languages[indexPath.row]
            selectedLanguage = language
            selectedLanguage.index = indexPath.row
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
