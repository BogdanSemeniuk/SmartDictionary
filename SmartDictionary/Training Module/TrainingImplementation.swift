//
//  TrainingImplementation.swift
//  SmartDictionary
//
//  Created by Bogdan on 31.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import RealmSwift

enum NextCardResult {
    case card
    case cardsEnded
}

protocol Training {
    var familiarWordsCount: Int { get set }
    var result: Double { get }
    func getCardTitle() -> String
    func nextCard() -> NextCardResult
    func flipCard() -> String
}

class TrainingImplementation: Training {

    var familiarWordsCount = 0
    private var trainingSettings: TrainingSettings
    private var wordCards: Results<WordCard>
    private var cardsIndices = Set<Int>()
    private var trainingCard: TrainingCard?
    var result: Double {
        return Double(100 * familiarWordsCount) / Double(cardsIndices.count)
    }

    init(trainingSettings: TrainingSettings, storage: Storage) {
        self.trainingSettings = trainingSettings
        self.wordCards = storage.wordCards
    }

    deinit { print("TrainingImplementation deinit") }

    func getCardTitle() -> String {
        guard let trainingCard = trainingCard else { return "" }
        if trainingCard.isFlipped {
            return trainingCard.backSide
        } else {
            return trainingCard.frontSide
        }
    }

    func flipCard() -> String {
        if let trainingCard = trainingCard {
            self.trainingCard?.isFlipped = !trainingCard.isFlipped
        }
        return getCardTitle()
    }

    func nextCard() -> NextCardResult {
        if trainingSettings.cardsCount == cardsIndices.count { return .cardsEnded }
        let index = getIndex()
        let trainingCard = getTrainingCard(from: wordCards[index])
        self.trainingCard = trainingCard
        return .card
    }

    private func getIndex() -> Int {
        var index: Int!
        if trainingSettings.randomOrder {
            index = Int(arc4random_uniform(UInt32(wordCards.count)))
            while cardsIndices.contains(index) {
                index = Int(arc4random_uniform(UInt32(wordCards.count)))
            }
            cardsIndices.insert(index)
        } else {
            index = cardsIndices.count
        }
        return index
    }

    private func getTrainingCard(from wordCard: WordCard) -> TrainingCard {
        switch trainingSettings.cardLanguage {
        case .english:
            return TrainingCard(frontSide: wordCard.value, backSide: wordCard.translation)
        case .russian:
            return TrainingCard(frontSide: wordCard.translation, backSide: wordCard.value)
        case .random:
            if arc4random_uniform(UInt32(2)) == 0 {
                return TrainingCard(frontSide: wordCard.value, backSide: wordCard.translation)
            } else {
                return TrainingCard(frontSide: wordCard.translation, backSide: wordCard.value)
            }
        }
    }
}
