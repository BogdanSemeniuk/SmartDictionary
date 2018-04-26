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
    func execute<T>(request: URLRequest, completionHandler: @escaping (Result<ApiResponse<T>>) -> Void)
}

class ApiClientImplementation: ApiClient {
    func execute<T>(request: URLRequest, completionHandler: @escaping (Result<ApiResponse<T>>) -> Void) {
        Alamofire.request(request).response { (serverResponse) in
            guard let httpUrlResponse = serverResponse.response else {
                if let error = serverResponse.error {
                    completionHandler(.failure(error))
                }
                return
            }
            switch httpUrlResponse.statusCode {
            case 200...299:
                do {
                    let response = try ApiResponse<T>(data: serverResponse.data, httpUrlResponse: httpUrlResponse)
                    completionHandler(.success(response))
                } catch {
                    if let error = serverResponse.error {
                        completionHandler(.failure(error))
                    }
                }
            default: completionHandler(.failure(ApiError(data: serverResponse.data, httpUrlResponse: httpUrlResponse)))
            }
        }
    }
}
