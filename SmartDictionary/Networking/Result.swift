//
//  Result.swift
//  SmartDictionary
//
//  Created by Bogdan on 23.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

struct NetworkRequestError: Error {
    let error: Error?
    
    var localizedDescription: String {
        return error?.localizedDescription ?? "Network request error - no other information"
    }
}

struct ParseError: Error {
    var statusCode = 600
    var localizedDescription = "A parsing error occured"
}

struct ApiError: Error {
    let data: Data?
    let httpUrlResponse: HTTPURLResponse
}
