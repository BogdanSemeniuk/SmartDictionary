//
//  NetworkingManager.swift
//  SmartDictionary
//
//  Created by Bogdan on 20.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import Alamofire

protocol TranslateManager {
    func translate(word: String, complition: @escaping (Result<WordDetails>) -> ())
}



class NetworkingManager: TranslateManager {
    var apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func translate(word: String, complition: @escaping (Result<WordDetails>) -> ()) {
        let urlRequest = try! APIRequest.translate(word: word).asURLRequest()
        apiClient.execute(request: urlRequest) { (result: Result<ApiResponse<WordDetails>>)  in
            switch result {
            case let .success(response):
                return
            case let .failure(error):
                return
            }
        }
    }
}

