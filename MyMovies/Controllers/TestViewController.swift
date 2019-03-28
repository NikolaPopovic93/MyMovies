//
//  TestViewController.swift
//  MyMovies
//
//  Created by Apple on 3/28/19.
//  Copyright © 2019 Nikola Popovic. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "TestTableViewCell"
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: cellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: Table View Data Source
extension TestViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TestTableViewCell
        cell.setInit(movie: movies[indexPath.row])
        return cell
    }
}

// MARK: Table View Delegate
extension TestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TestTableViewCell
        for movie in movies where movie.id == cell.tag {
            movie.isExpand = !movie.isExpand
        }
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

