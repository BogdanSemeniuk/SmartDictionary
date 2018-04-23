//
//  ApiConstants.swift
//  SmartDictionary
//
//  Created by Bogdan on 20.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "https://glosbe.com/gapi/translate"
}

enum APIParameterKey: String {
    case languageFrom = "from"
    case languageInto = "dest"
    case returnType = "format"
    case phrase = "phrase"
    case pretty = "pretty"
}
