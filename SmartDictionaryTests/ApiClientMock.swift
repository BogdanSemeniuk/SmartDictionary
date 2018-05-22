//
//  ApiClientMock.swift
//  SmartDictionaryTests
//
//  Created by Bogdan on 22.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import XCTest
@testable import SmartDictionary

class ApiClientMock: ApiClient {
    
    var typeOfResponse: Response = .getSuccess
    private let error = MockError(description: "Some error")
    
    func execute(request: URLRequest, completionHandler: @escaping (Result<ApiResponse>) -> Void) {
        let response = HTTPURLResponse(url: URL(string: "url")!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
        let urlForData = Bundle.main.url(forResource: "wordDetails", withExtension: "json")!
        let data = try! Data(contentsOf: urlForData)
        switch typeOfResponse {
        case .getSuccess:
            completionHandler(.success(ApiResponse(httpUrlResponse: response, data: data)))
        case .getError:
            completionHandler(.failure(error))
            
        }
    }
}

enum Response {
    case getSuccess
    case getError
}

struct MockError: ErrorDescription {
    var description: String
}
