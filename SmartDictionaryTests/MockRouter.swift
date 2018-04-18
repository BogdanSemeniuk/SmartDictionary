//
//  MockRouter.swift
//  SmartDictionaryTests
//
//  Created by Bogdan on 18.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
@testable import SmartDictionary

class MockRouter: Router {
    var currentNavigation: Destination?
    
    override func navigate(to destination: Router.Destination) {
        currentNavigation = destination
    }
}
