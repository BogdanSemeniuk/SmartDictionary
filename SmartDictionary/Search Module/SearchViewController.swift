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
    
    var presenter: SearchViewPresenter!
    
    deinit { print("SearchViewController deinit") }
}

// MARK: - SearchView protocol

protocol SearchView: class {
}
