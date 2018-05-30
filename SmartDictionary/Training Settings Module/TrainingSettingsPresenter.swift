//
//  TrainingSettingsPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 25.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol SettingsViewPresenter {
    func settingsViewDidLoad()
    func currentValues(segmentIndex: Int, switchIsOn: Bool, sliderValue: Int)
}

class TrainingSettingsPresenter: SettingsViewPresenter {
    
    private weak var view: TrainingSettingsView?
    private var wordService: Storage
    private var router: Router
    
    init(view: TrainingSettingsView, wordService: Storage, router: Router) {
        self.view = view
        self.wordService = wordService
        self.router = router
    }
    
    func settingsViewDidLoad() {
        view?.setSlider(maxValue: wordService.wordCards.count)
    }
    
    func currentValues(segmentIndex: Int, switchIsOn: Bool, sliderValue: Int) {
        var language = CardLanguage.random
        switch segmentIndex {
        case CardLanguage.english.rawValue: language = .english
        case CardLanguage.russian.rawValue: language = .russian
        default: break
        }
        let settings = TrainingSettings(cardLanguage: language, randomOrder: switchIsOn, cardsCount: sliderValue)
        router.navigate(to: .training(settings))
    }
}
