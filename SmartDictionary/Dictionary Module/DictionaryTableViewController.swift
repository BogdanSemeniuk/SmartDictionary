//
//  DictionaryTableViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 08.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol DictionaryView: class {
}

class DictionaryTableViewController: UITableViewController, DictionaryView {

    var presenter: DictionaryViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showObjects()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
}
