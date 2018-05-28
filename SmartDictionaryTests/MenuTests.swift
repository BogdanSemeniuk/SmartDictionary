//
//  MenuTests.swift
//  SmartDictionaryTests
//
//  Created by Bogdan on 17.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import XCTest
import RealmSwift
@testable import SmartDictionary

class MenuTests: XCTestCase {
    
    var menuPresenter: MenuPresenter!
    var router: RouterSpy!
    var wordService: WordService!
    var depenpencyContainer: DependencyContainer!
    
    override func setUp() {
        super.setUp()
        depenpencyContainer = DependencyContainer()
        let storage = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        let apiClient = ApiClientMock()
        wordService = WordService(storage: storage, apiClient: apiClient)
        router = RouterSpy(navigationController: nil, dependencyContainer: depenpencyContainer)
        menuPresenter = MenuPresenter(view: nil, router: router, menuService: wordService)
    }
    
    override func tearDown() {
        super.tearDown()
        menuPresenter = nil
        router = nil
        wordService = nil
        depenpencyContainer = nil
    }
    
    func testNavigateMethodCalledWhenSearchButtonTapped() {
        menuPresenter.searchButtonWasTapped()
        XCTAssertNotNil(router.currentNavigation, "Navigation method was not call")
    }
    
    func testNavigateMethodCalledWhenDictionaryButtonTapped() {
        menuPresenter.dictionaryButtonWasTapped()
        XCTAssertNotNil(router.currentNavigation, "Navigation method was not call")
    }
    
    func testNavigateMethodDoesntCallWithEmptyDictionary() {
        menuPresenter.trainingButtonWasTapped()
        
        XCTAssert(wordService.wordCards.isEmpty, "Dictionary isn't empty")
        XCTAssertNil(router.currentNavigation, "Navigation method was not call")
    }
    
    func testNavigateMethodCallsWithNotEmptyDictionary() {
        let wordCard = WordCard(value: "Hello", translation: "Здравствуйте")
        
        wordService.add(word: wordCard)
        menuPresenter.trainingButtonWasTapped()
        
        XCTAssertNotNil(router.currentNavigation, "Navigation method was not call")
    }
}
