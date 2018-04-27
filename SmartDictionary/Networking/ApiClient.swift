//
//  ApiClient.swift
//  SmartDictionary
//
//  Created by Bogdan on 23.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiClient {
    func execute(request: URLRequest, completionHandler: @escaping (Result<ApiResponse>) -> Void)
}

class ApiClientImplementation: ApiClient {
    func execute(request: URLRequest, completionHandler: @escaping (Result<ApiResponse>) -> Void) {
        Alamofire.request(request).response { (serverResponse) in
            guard let httpUrlResponse = serverResponse.response else {
                if let error = serverResponse.error {
                    completionHandler(.failure(NetworkRequestError(error: error)))
                }
                return
            }
            switch httpUrlResponse.statusCode {
            case 200...299:
                let response = ApiResponse(httpUrlResponse: httpUrlResponse, data: serverResponse.data)
                completionHandler(.success(response))
            default: completionHandler(.failure(ApiError(data: serverResponse.data, httpUrlResponse: httpUrlResponse)))
            }
        }
    }
}
