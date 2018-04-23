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
    func translate(word: String, complition: @escaping (WordDetails) -> ())
}



class NetworkingManager: TranslateManager {
    var apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func translate(word: String, complition: @escaping (WordDetails) -> ()) {
        let urlRequest = try! APIRequest.translate(word: word).asURLRequest()
        apiClient.execute(request: urlRequest)
    }
}

