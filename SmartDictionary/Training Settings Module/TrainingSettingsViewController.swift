//
//  TrainingSettingsViewController.swift
//  SmartDictionary
//
//  Created by Bogdan on 25.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol TrainingSettingsView: class {
    func setSlider(maxValue: Int)
}

class TrainingSettingsViewController: UIViewController, TrainingSettingsView, StoryboardIdentifiable {

    var presenter: SettingsViewPresenter!
    @IBOutlet private weak var cardsLanguageSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var randomOrderSwitch: UISwitch!
    @IBOutlet private weak var countCardsSlider: UISlider!
    @IBOutlet private weak var currentCountOfCardsLabel: UILabel!
    @IBOutlet private weak var maxCountOfCardsLabel: UILabel!

    deinit { print("TrainingSettingsViewController deinit") }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.settingsViewDidLoad()
    }

    func setSlider(maxValue: Int) {
        maxCountOfCardsLabel.text = String(maxValue)
        countCardsSlider.minimumValue = 1.0
        countCardsSlider.maximumValue = Float(maxValue)
    }

    @IBAction private func playButtonPressed(_ sender: UIButton) {
        presenter.currentValues(segmentIndex: cardsLanguageSegmentedControl.selectedSegmentIndex,
                                switchIsOn: randomOrderSwitch.isOn,
                                sliderValue: Int(countCardsSlider.value))
    }

    @IBAction private func sliderValueChanged(_ sender: UISlider) {
        sender.setValue(sender.value.rounded(.down), animated: true)
        currentCountOfCardsLabel.text = String(Int(countCardsSlider.value))
    }
}
