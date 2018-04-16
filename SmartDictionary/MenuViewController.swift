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
    
    deinit {
        print("MenuViewController deinit")
    }
}

// MARK: - MenuView protocol

protocol MenuView: class {
    
}
