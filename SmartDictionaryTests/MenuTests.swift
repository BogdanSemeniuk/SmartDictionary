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
    var router: MockRouter!
    var nc: UINavigationController!
    var depenpencyContainer: DependencyContainer!
    
    override func setUp() {
        super.setUp()
        nc = UINavigationController()
        depenpencyContainer = DependencyContainer()
        router = MockRouter(navigationController: nc, dependencyContainer: depenpencyContainer)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        view = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuPresenter = MenuPresenter(view: view, router: router)
        view.presenter = menuPresenter
    }
    
    override func tearDown() {
        super.tearDown()
        menuPresenter = nil
        view = nil
        router = nil
        nc = nil
        depenpencyContainer = nil
    }
    
    func testNavigateMethodCalledWhenSearchButtonTapped() {
        let button = UIButton()
        XCTAssertNil(router.currentNavigation, "MockRouter.currentNavigation is not nil")
        view.searchButtonTapped(button)
        XCTAssertNotNil(router.currentNavigation, "Navigation method was not call")
    }
}
