//
//  WordService.swift
//  SmartDictionary
//
//  Created by Bogdan on 22.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import RealmSwift

protocol WordSearch {
    func add(word: WordCard?)
    func translate(word: String)
}

protocol WordsStorage {
    func flip(wordCard: WordCard)
    func delete(wordCard: WordCard)
    var wordCards: Results<WordCard> { get }
}

class WordService: WordSearch, WordsStorage {
    private var storage: Realm!
    private var apiClient: ApiClient!
    var wordCards: Results<WordCard> {
        return storage.objects(WordCard.self)
    }
    
    init(storage: Realm, apiClient: ApiClient) {
        self.storage = storage
        self.apiClient = apiClient
    }
    
    func add(word: WordCard?)  {
        guard let word = word, storage.object(ofType: WordCard.self, forPrimaryKey: word.value) == nil else { return }
        try! storage.write {
            storage.add(word)
        }
    }
    
    func flip(wordCard: WordCard) {
        try! storage.write {
            wordCard.isFlipped = !wordCard.isFlipped
        }
    }
    
    func delete(wordCard: WordCard) {
        try! storage.write {
            storage.delete(wordCard)
        }
    }
    
    func translate(word: String) {
        let urlRequest = try! APIRequest.translate(word: word).asURLRequest()
        apiClient.execute(request: urlRequest) { (result: Result<ApiResponse>) in
            switch result {
            case .success(let response):
                if let responseData = response.data {
                    do {
                        let wordDetails = try JSONDecoder().decode(WordDetails.self, from: responseData)
                        NotificationCenter.default.post(name: NSNotification.Name("wordDetails"), object: Result<WordDetails>.success(wordDetails))
                    } catch {
                        NotificationCenter.default.post(name: NSNotification.Name("wordDetails"), object: Result<WordDetails>.failure(ParseError()))
                    }
                }
            case .failure(let error):
                NotificationCenter.default.post(name: NSNotification.Name("wordDetails"), object: Result<WordDetails>.failure(error))
            }
        }
    }
}
