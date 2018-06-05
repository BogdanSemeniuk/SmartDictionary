//
//  WordDetails.swift
//  SmartDictionary
//
//  Created by Bogdan on 23.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

struct WordDetails: Decodable {
    var tuc: [WordParts]
    var phrase: String
}

struct WordParts: Decodable {
    var phrase: Phrase?
    var meanings: [Meaning]?
}

struct Phrase: Decodable {
    var text: String
}

struct Meaning: Decodable {
    var text: String
    var language: String
}
