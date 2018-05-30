//
//  TrainingPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 30.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol TrainingViewPresenter {
}

class TrainingPresenter: TrainingViewPresenter {
    
    private weak var view: TrainingView?
    private var settings: TrainingSettings
    
    init(view: TrainingView, settings: TrainingSettings) {
        self.view = view
        self.settings = settings
    }
}
