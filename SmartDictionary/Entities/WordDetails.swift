//
//  WordDetails.swift
//  SmartDictionary
//
//  Created by Bogdan on 23.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

struct WordDetails: Decodable {
    var tuc: [WordDescription]
    var phrase: String
}

struct WordDescription: Decodable {
    var phrase: Phrase?
    var meanings: [Meaning]?
}

struct Meaning: Decodable {
    var text: String
}

struct Phrase: Decodable {
    var text: String
}
