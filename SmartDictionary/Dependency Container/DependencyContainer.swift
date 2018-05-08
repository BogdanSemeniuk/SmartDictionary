//
//  DependencyContainer.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import RealmSwift

class DependencyContainer {
    lazy var apiClient = ApiClientImplementation()
    lazy var networkingManager = NetworkingManager(apiClient: apiClient)
    lazy var storage = try! Realm()
}

