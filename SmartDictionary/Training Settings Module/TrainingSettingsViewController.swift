//
//  TrainingSettingsViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 25.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol TrainingSettingsView: class {
}

class TrainingSettingsViewController: UIViewController, TrainingSettingsView {
    
    var presenter: SettingsViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
