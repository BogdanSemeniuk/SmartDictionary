//
//  ResultViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 07.06.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol ResultView: class {
    func setResultLabel(with result: Double)
}

class ResultViewController: UIViewController, ResultView, StoryboardIdentifiable {

    var presenter: ResultViewPresenter!
    @IBOutlet weak var resultLabel: UILabel!

    deinit { print("ResultViewController deinit") }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.resultViewDidLoad()
    }

    @IBAction func okButtonPressed(_ sender: UIButton) {
        presenter.okButtonWasPressed()
    }

    func setResultLabel(with result: Double) {
        resultLabel.text = String(format: "%.1f", result) + " %"
    }
}
