//
//  TrainingViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 30.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol TrainingView: class {
}

class TrainingViewController: UIViewController, TrainingView {
    
    var presenter: TrainingViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
