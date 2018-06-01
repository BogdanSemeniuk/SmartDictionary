//
//  TrainingPresenter.swift
//  SmartDictionary
//
//  Created by Bogdan on 30.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol TrainingViewPresenter {
    func trainingViewDidLoad()
    func cardWasTapped()
}

class TrainingPresenter: TrainingViewPresenter {
    
    private weak var view: TrainingView?
    private var training: Training
    
    init(view: TrainingView, training: Training) {
        self.view = view
        self.training = training
    }
    
    func trainingViewDidLoad() {
        if training.nextCard() != nil {
            let cardTitle = training.getCard()
            view?.set(cardTitle: cardTitle)
        } else {
            print("Finish!")
        }
    }
    
    func cardWasTapped() {
        let cardTitle = training.flipCard()
        view?.set(cardTitle: cardTitle)
    }
}
