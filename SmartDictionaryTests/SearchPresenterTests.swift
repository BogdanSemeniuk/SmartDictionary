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
    
    var wordService: WordService!
    var apiClient: ApiClientMock!
    var searchPresenter: SearchPresenter!
    
    override func setUp() {
        super.setUp()
        let storage = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        apiClient = ApiClientMock()
        wordService = WordService(storage: storage, apiClient: apiClient)
        searchPresenter = SearchPresenter(view: nil, wordService: wordService)
    }
    
    override func tearDown() {
        wordService = nil
        searchPresenter = nil
        super.tearDown()
    }
    
    
    func testWordDetailsSetWhenResponseReceived() {
        // 1. given
        apiClient.typeOfResponse = .getSuccess
        // 2. when
        searchPresenter.searchButtonPressed(text: "hello")
        // 3. then
        XCTAssert(searchPresenter.numberOfItems != 0)
    }

//    func testWordDetailsDidNotSetWhenErrorReceived() {
//        // 1. given
//        networkingManager.typeOfResponse = .getError
//        // 2. when
//        searchPresenter.searchButtonPressed(text: "")
//        // 3. then
//        XCTAssert(searchPresenter.numberOfItems == 0)
//    }
//
//    func testAddWordToStoreWhenAddButtonPressed() {
//        // 1. given
//        networkingManager.typeOfResponse = .getSuccess
//        // 2. when
//        searchPresenter.searchButtonPressed(text: "")
//        searchPresenter.addToDictionaryWasTapped()
//        // 3. then
//        XCTAssert(storage.objects(WordCard.self).count == 1)
//    }
//
//    func testAddButtonWasTappedWhenErrorWasSended() {
//        // 1. given
//        networkingManager.typeOfResponse = .getError
//        // 2. when
//        searchPresenter.searchButtonPressed(text: "")
//        searchPresenter.addToDictionaryWasTapped()
//        // 3. then
//        XCTAssert(storage.objects(WordCard.self).count == 0)
//    }
//
//    func testAddWordToStoreWhenAddPressedFewTimes() {
//        // 1. given
//        networkingManager.typeOfResponse = .getSuccess
//        // 2. when
//        searchPresenter.searchButtonPressed(text: "")
//        searchPresenter.addToDictionaryWasTapped()
//        searchPresenter.addToDictionaryWasTapped()
//        // 3. then
//        XCTAssert(storage.objects(WordCard.self).count == 1)
//    }
}
