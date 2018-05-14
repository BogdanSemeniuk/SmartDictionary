//
//  SearchPresenterTests.swift
//  SmartDictionaryTests
//
//  Created by Bogdan on 07.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import XCTest
import RealmSwift
@testable import SmartDictionary

class SearchPresenterTests: XCTestCase {
    
    var storage: Realm!
    var searchPresenter: SearchPresenter!
    var networkingManager: NetworkingManagerMock!
    
    override func setUp() {
        super.setUp()
        networkingManager = NetworkingManagerMock()
        storage = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        searchPresenter = SearchPresenter(view: nil, networkingManager: networkingManager, storage: storage)
    }
    
    override func tearDown() {
        searchPresenter = nil
        networkingManager = nil
        super.tearDown()
    }
    
    func testWordDetailsSetWhenResponseReceived() {
        // 1. given
        networkingManager.typeOfResponse = .getSuccess
        // 2. when
        searchPresenter.searchButtonPressed(text: "")
        // 3. then
        XCTAssert(searchPresenter.numberOfItems != 0)
    }
    
    func testWordDetailsDidNotSetWhenErrorReceived() {
        // 1. given
        networkingManager.typeOfResponse = .getError
        // 2. when
        searchPresenter.searchButtonPressed(text: "")
        // 3. then
        XCTAssert(searchPresenter.numberOfItems == 0)
    }
    
    func testAddWordToStoreWhenAddButtonPressed() {
        // 1. given
        networkingManager.typeOfResponse = .getSuccess
        // 2. when
        searchPresenter.searchButtonPressed(text: "")
        searchPresenter.addToDictionaryWasTapped()
        // 3. then
        XCTAssert(storage.objects(WordCard.self).count == 1)
    }
    
    func testAddButtonWasTappedWhenErrorWasSended() {
        // 1. given
        networkingManager.typeOfResponse = .getError
        // 2. when
        searchPresenter.searchButtonPressed(text: "")
        searchPresenter.addToDictionaryWasTapped()
        // 3. then
        XCTAssert(storage.objects(WordCard.self).count == 0)
    }
    
    func testAddWordToStoreWhenAddPressedFewTimes() {
        // 1. given
        networkingManager.typeOfResponse = .getSuccess
        // 2. when
        searchPresenter.searchButtonPressed(text: "")
        searchPresenter.addToDictionaryWasTapped()
        searchPresenter.addToDictionaryWasTapped()
        // 3. then
        XCTAssert(storage.objects(WordCard.self).count == 1)
    }
}
