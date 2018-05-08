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
    var router: RouterSpy!
    var nc: UINavigationController!
    var depenpencyContainer: DependencyContainer!
    
    override func setUp() {
        super.setUp()
        nc = UINavigationController()
        depenpencyContainer = DependencyContainer()
        router = RouterSpy(navigationController: nc, dependencyContainer: depenpencyContainer)
        menuPresenter = MenuPresenter(view: nil, router: router)
    }
    
    override func tearDown() {
        super.tearDown()
        menuPresenter = nil
        router = nil
        nc = nil
        depenpencyContainer = nil
    }
    
    func testNavigateMethodCalledWhenSearchButtonTapped() {
        XCTAssertNil(router.currentNavigation, "MockRouter.currentNavigation is not nil")
        menuPresenter.searchButtonWasTapped()
        XCTAssertNotNil(router.currentNavigation, "Navigation method was not call")
    }
}
