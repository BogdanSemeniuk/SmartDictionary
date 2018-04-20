//
//  ApiRequest.swift
//  SmartDictionary
//
//  Created by Bogdan on 20.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

import Alamofire

enum APIRequest {
    case translate(word: String)
}

extension APIRequest: URLRequestConvertible {
    private var method: HTTPMethod {
        switch self {
        case .translate(word: _):
            return .get
        }
    }
    
    private var task: [URLQueryItem]? {
        switch self {
        case .translate(let word):
            let languageFromQuery = URLQueryItem(name: APIParameterKey.languageFrom.rawValue, value: "eng")
            let languageIntoQuery = URLQueryItem(name: APIParameterKey.languageInto.rawValue, value: "rus")
            let returnTypeQuery = URLQueryItem(name: APIParameterKey.returnType.rawValue, value: "json")
            let phraseQuery = URLQueryItem(name: APIParameterKey.phrase.rawValue, value: word)
            let prettyQuery = URLQueryItem(name: APIParameterKey.pretty.rawValue, value: "true")
            return [languageFromQuery, languageIntoQuery, returnTypeQuery, phraseQuery, prettyQuery]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: APIConstants.baseURL)
        urlComponents?.queryItems = task
        if let url = try urlComponents?.asURL() {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            return request
        }
        assert(false, "Can not make url with urlComponents")
        return URLRequest(url: URL(string: "https://www.google.com/")!)
    }
}
