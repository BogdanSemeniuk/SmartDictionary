//
//  WordDetails.swift
//  SmartDictionary
//
//  Created by Bogdan on 23.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol InitializableWithData {
    init(data: Data?) throws
}

protocol InitializableWithJson {
    init(json: [String : Any]) throws
}

struct WordDescription {
    var phrase: String?
    var meanings: [String]?
}

struct WordDetails: InitializableWithData, InitializableWithJson {
    var details: [WordDescription]
    
    init(data: Data?) throws {
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data),
            let json = jsonObject as? [String: Any] else {
                throw ParseError()
        }
        try self.init(json: json)
    }
    
    init(json: [String : Any]) throws {
        var wordDesciptions = [WordDescription]()
        guard let descriptions = json["tuc"] as? [Any] else { throw ParseError() }
        for obj in descriptions {
            guard let object = obj as? [String: Any] else { throw ParseError() }
            var wordDescription = WordDescription()
            if let phrase = object["phrase"] as? [String: String] {
                wordDescription.phrase = phrase["text"]
            }
            if let meanings = object["meanings"] as? [Any] {
                wordDescription.meanings = [String]()
                for meaning in meanings {
                    if let meaning = meaning as? [String: String], meaning["text"] != nil {
                        wordDescription.meanings?.append(meaning["text"]!)
                    }
                }
            }
            wordDesciptions.append(wordDescription)
        }
        self.details = wordDesciptions
    }
}


