//
//  MockNetworkingManager.swift
//  SmartDictionaryTests
//
//  Created by Bogdan on 07.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
@testable import SmartDictionary

class NetworkingManagerMock: TranslateManager {
    
    var typeOfResponse: Response = .getSuccess
    private let wordDetails = WordDetails(tuc: [WordParts(phrase: Phrase(text: "слово"), meanings: [Meaning(text: "слово", language: "ru")])], phrase: "word")
    private let error = MockError(description: "Some error")
    
    func translate(word: String, complition: @escaping (Result<WordDetails>) -> ()) {
        let response: Result<WordDetails> = typeOfResponse == .getSuccess ? .success(wordDetails) : .failure(error)
        complition(response)
    }
}

enum Response {
    case getSuccess
    case getError
}

struct MockError: ErrorDescription {
    var description: String
}
