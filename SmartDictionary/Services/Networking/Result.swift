//
//  Result.swift
//  SmartDictionary
//
//  Created by Bogdan on 23.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(ErrorDescription)
}
