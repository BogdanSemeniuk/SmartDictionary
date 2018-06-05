//
//  SearchViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 17.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol SearchView: class {
    func setupView()
    func updateView()
    func showErrorMessage(message: String)
}

class SearchViewController: UIViewController, SearchView {

    // MARK: - Properties and outlet

    @IBOutlet private weak var searchBar: UISearchBar!
    var presenter: SearchViewPresenter!
    @IBOutlet private weak var meaningsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.searchViewDidLoad()
    }

    deinit { print("SearchViewController deinit") }

    // MARK: - View

    func setupView() {
        searchBar.autocapitalizationType = .none
        meaningsTableView.rowHeight = UITableViewAutomaticDimension
        meaningsTableView.estimatedRowHeight = 140
    }

    func updateView() {
        meaningsTableView.reloadData()
    }

    func showErrorMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Actions

    @IBAction func addToDictionaryTapped(_ sender: UIButton) {
        presenter.addToDictionaryWasTapped()
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeaningTableViewCell", for: indexPath) as! MeaningTableViewCell
        presenter.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.searchButtonPressed(text: searchBar.text!)
    }
}
