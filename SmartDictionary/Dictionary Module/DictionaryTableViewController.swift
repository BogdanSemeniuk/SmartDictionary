//
//  DictionaryTableViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 08.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol DictionaryView: class {
    func setUpTableView(with nib: UINib)
    func deleteCell(at row: Int)
    func insertCell(at row: Int)
    func giveCell(at row: Int) -> DictionaryCell
}

class DictionaryTableViewController: UITableViewController, DictionaryView, StoryboardIdentifiable {

    var presenter: DictionaryViewPresenter!
    private let reuseIdentifier = "dictionaryCell"

    deinit { print("DictionaryTableViewController deinit") }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.dictionaryViewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DictionaryCell
        presenter.configure(cell: cell, forRow: indexPath.row)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! DictionaryCell
        presenter.selected(cell: cell, forRow: indexPath.row)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        presenter.cellDeleted(forRow: indexPath.row)
    }

    override func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        tableView.reloadData()
    }

    func giveCell(at row: Int) -> DictionaryCell {
        let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as! DictionaryCell
        return cell
    }

    func insertCell(at row: Int) {
        tableView.insertRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
    }

    func deleteCell(at row: Int) {
        tableView.deleteRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
    }

    func setUpTableView(with nib: UINib) {
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}
