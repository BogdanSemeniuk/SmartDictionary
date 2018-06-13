//
//  WordServiceTests.swift
//  SmartDictionaryTests
//
//  Created by Bogdan on 13.06.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import XCTest
import RealmSwift
@testable import SmartDictionary

class WordServiceTests: XCTestCase {

    var wordService: WordService!
    var apiClient: ApiClientMock!

    override func setUp() {
        super.setUp()

        apiClient = ApiClientMock()
        let storage = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        wordService = WordService(storage: storage, apiClient: apiClient)
    }

    override func tearDown() {
        wordService = nil
        apiClient = nil
        super.tearDown()
    }

    func testAddWordCardToStore() {
        // 1. given
        let wordCrad = WordCard(value: "hello", translation: "привет")
        // 2. when
        wordService.add(word: wordCrad)
        // 3. then
        guard let firstCardInStore = wordService.wordCards.first else { XCTFail("WordCard didn't save to the store"); return }
        XCTAssertEqual(firstCardInStore, wordCrad, "The cards isn't equal")
    }

    func testAddTwoSameWordCardsToStore() {
        // 1. given
        let wordCrad = WordCard(value: "hello", translation: "привет")
        let secondWordCrad = WordCard(value: "hello", translation: "привет")
        // 2. when
        wordService.add(word: wordCrad)
        wordService.add(word: secondWordCrad)
        // 3. then
        XCTAssertTrue(wordService.wordCards.count == 1, "Can't be two same cards in the storage")
    }

    func testFlipWordCard() {
        // 1. given
        let wordCrad = WordCard(value: "hello", translation: "привет")
        // 2. when
        wordService.add(word: wordCrad)
        wordService.flip(wordCard: wordCrad)
        // 3. then
        guard let firstCardInStore = wordService.wordCards.first else { XCTFail("WordCard didn't save to the store"); return }
        XCTAssertTrue(firstCardInStore.isFlipped, "Flip method doesn't work")
    }

    func testDeleteWordCard() {
        // 1. given
        let wordCrad = WordCard(value: "hello", translation: "привет")
        let secondWordCrad = WordCard(value: "hell", translation: "ад")
        let thirdWordCrad = WordCard(value: "ask", translation: "просить")
        // 2. when
        wordService.add(word: wordCrad)
        wordService.add(word: secondWordCrad)
        wordService.add(word: thirdWordCrad)
        wordService.delete(wordCard: wordCrad)
        // 3. then
        XCTAssert(wordService.wordCards.count == 2, "Delete method doesn't work")
    }

    func testExecuteTranslationRequest() {
        // 1. given
        let word = "hello"
        // 2. when
        wordService.translate(word: word) { _ in }
        // 3. then
        XCTAssertTrue(apiClient.didResponseSent, "Response didn't sent")
    }
}
