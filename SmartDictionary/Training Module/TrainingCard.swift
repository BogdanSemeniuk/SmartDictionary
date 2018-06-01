//
//  TrainingCard.swift
//  SmartDictionary
//
//  Created by Bogdan on 31.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

struct TrainingCard {
    var frontSide: String
    var backSide: String
    var isFlipped: Bool
    
    init(frontSide: String, backSide: String) {
        self.frontSide = frontSide
        self.backSide = backSide
        self.isFlipped = false
    }
}

