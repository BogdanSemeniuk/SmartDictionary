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
    var didResponseSent = false
    var data: Data {
        let urlForData = Bundle(for: type(of: self)).url(forResource: "wordDetails", withExtension: "json")
        let data = try! Data(contentsOf: urlForData!)
        return data
    }

    func execute(request: URLRequest, completionHandler: @escaping (Result<ApiResponse>) -> Void) {
        let response = HTTPURLResponse(url: URL(string: "url")!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
        didResponseSent = true
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
