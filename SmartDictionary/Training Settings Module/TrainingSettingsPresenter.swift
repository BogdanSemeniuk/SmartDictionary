//
//  TrainingSettingsPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 25.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol SettingsViewPresenter {
}

class TrainingSettingsPresenter: SettingsViewPresenter {
    private weak var view: TrainingSettingsView?
    
    init(view: TrainingSettingsView) {
        self.view = view
    }
}
