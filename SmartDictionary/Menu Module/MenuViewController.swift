//
//  MenuViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol MenuView: class {
    func setupView()
    func showMessage()
}

class MenuViewController: UIViewController, MenuView {
    
    // MARK: - Properties and outlet
    
    var presenter: MenuViewPresenter!
    private lazy var alertMessage: UIAlertController = {
        let alertController = UIAlertController(title: "Message", message: "You must add at least one word to dictionary!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(action)
        return alertController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewWasLoaded()
    }
    
    deinit { print("MenuViewController deinit") }
    
    func setupView() {
        navigationItem.title = "Menu"
    }
    
    func showMessage() {
        present(alertMessage, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        presenter.searchButtonWasTapped()
    }
    @IBAction func dictionaryButtonTapped(_ sender: UIButton) {
        presenter.dictionaryButtonWasTapped()
    }
    @IBAction func trainingButtonTapped(_ sender: UIButton) {
        presenter.trainingButtonWasTapped()
    }
}
