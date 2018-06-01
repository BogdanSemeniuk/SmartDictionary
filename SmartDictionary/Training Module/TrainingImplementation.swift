//
//  TrainingImplementation.swift
//  SmartDictionary
//
//  Created by Bogdan on 31.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import RealmSwift

protocol Training {
    func getCard() -> String
    func nextCard() -> TrainingCard?
    func flipCard() -> String
}

class TrainingImplementation: Training {
    
    private var trainingSettings: TrainingSettings
    private var wordCards: Results<WordCard>
    private var cardsIndices = Set<Int>()
    private var trainingCard: TrainingCard?
    
    init(trainingSettings: TrainingSettings, storage: Storage) {
        self.trainingSettings = trainingSettings
        self.wordCards = storage.wordCards
    }
    
    func getCard() -> String {
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
        return getCard()
    }
    
    func nextCard() -> TrainingCard? {
        if trainingSettings.cardsCount == cardsIndices.count { return nil }
        let index = getIndex()
        let trainingCard = getTrainingCard(from: wordCards[index])
        self.trainingCard = trainingCard
        return trainingCard
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
