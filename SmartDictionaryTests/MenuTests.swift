//
//  MenuTests.swift
//  SmartDictionaryTests
//
//  Created by Bogdan on 17.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import XCTest
@testable import SmartDictionary

class MenuTests: XCTestCase {
    
    var menuPresenter: MenuPresenter!
    var view: MenuViewController!
    var router: Router!
    var nc: UINavigationController!
    var depenpencyContainer: DependencyContainer!
    
    override func setUp() {
        super.setUp()
        nc = UINavigationController()
        depenpencyContainer = DependencyContainer()
        router = Router(navigationController: nc, dependencyContainer: depenpencyContainer)
        view = MenuViewController()
        menuPresenter = MenuPresenter(view: view, router: router)
    }
    
    override func tearDown() {
        super.tearDown()
        menuPresenter = nil
        view = nil
        router = nil
        nc = nil
        depenpencyContainer = nil
    }
    
    func testExample() {
        
    }
}
