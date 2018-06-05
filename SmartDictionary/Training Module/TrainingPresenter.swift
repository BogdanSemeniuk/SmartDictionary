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
    func cardWasDragged(isFamiliarWord: Bool)
}

class TrainingPresenter: TrainingViewPresenter {

    private weak var view: TrainingView?
    private var training: Training

    init(view: TrainingView, training: Training) {
        self.view = view
        self.training = training
    }

    func trainingViewDidLoad() {
        getNextCard()
    }

    func cardWasTapped() {
        let cardTitle = training.flipCard()
        view?.set(cardTitle: cardTitle)
    }

    func cardWasDragged(isFamiliarWord: Bool) {
        if isFamiliarWord {
            training.familiarWordsCount += 1
        }
        getNextCard()
    }

    private func getNextCard() {
        switch training.nextCard() {
        case .card:
            view?.set(cardTitle: training.getCardTitle())
        case .cardsEnded:
            break
        }
    }
}
