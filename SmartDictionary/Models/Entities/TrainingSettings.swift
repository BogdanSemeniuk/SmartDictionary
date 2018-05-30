//
//  TrainingSettings.swift
//  SmartDictionary
//
//  Created by Bogdan on 29.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

struct TrainingSettings {
    var cardLanguage: CardLanguage
    var randomOrder: Bool
    var cardsCount: Int
}

enum CardLanguage: Int {
    case english = 0
    case russian = 1
    case random = 2
}
