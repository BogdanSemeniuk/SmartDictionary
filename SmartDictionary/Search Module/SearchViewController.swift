//
//  SearchViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 17.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol SearchView: class {
}

class SearchViewController: UIViewController, SearchView {
    
    // MARK: - Properties and outlet
    
    @IBOutlet weak var searchBar: UISearchBar!
    var presenter: SearchViewPresenter!
    
    deinit { print("SearchViewController deinit") }
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
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchButtonPressed(text: searchBar.text!)
    }
}
