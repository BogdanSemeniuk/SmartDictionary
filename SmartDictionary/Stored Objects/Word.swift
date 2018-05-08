//
//  Word.swift
//  SmartDictionary
//
//  Created by Bogdan on 03.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Word: Object {
    dynamic var value = ""
    dynamic var translation = ""
    
    convenience init(value: String, translation: String) {
        self.init()
        self.value = value
        self.translation = translation
    }
    
    override static func primaryKey() -> String? {
        return "value"
    }
}

