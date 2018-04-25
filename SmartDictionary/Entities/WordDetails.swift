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

struct WordDetails: InitializableWithData {
    init(data: Data?) throws {
        
    }
}
