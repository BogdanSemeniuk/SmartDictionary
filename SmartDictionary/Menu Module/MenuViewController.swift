//
//  MenuViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, MenuView {
    
    // MARK: - Properties and outlet
    
    var presenter: MenuViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewWasLoaded()
    }
    
    deinit { print("MenuViewController deinit") }
    
    // MARK: - Set navigation title
    
    func setupView() {
        navigationItem.title = "Menu"
    }
    
    // MARK: - Actions
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        presenter.searchButtonWasTapped()
    }
    @IBAction func dictionaryButtonTapped(_ sender: UIButton) {
        
    }
    @IBAction func trainingButtonTapped(_ sender: UIButton) {
        
    }
    
    
}

// MARK: - MenuView protocol

protocol MenuView: class {
    func setupView()
}