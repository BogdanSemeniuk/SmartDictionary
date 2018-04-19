//
//  SearchViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 17.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, SearchView {
    
    // MARK: - Properties and outlet
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var presenter: SearchViewPresenter!
    
    deinit { print("SearchViewController deinit") }
}

// MARK: - SearchView protocol

protocol SearchView: class {
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
}
