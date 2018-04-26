//
//  Errors.swift
//  SmartDictionary
//
//  Created by Bogdan on 26.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol ErrorDescription {
    var localizedDescription: String { get }
}

struct NetworkRequestError: Error, ErrorDescription {
    let error: Error?
    
    var localizedDescription: String {
        return error?.localizedDescription ?? "Network request error - no other information"
    }
}

struct ParseError: Error, ErrorDescription {
    var statusCode = 600
    var localizedDescription = "A parsing error occured"
}

struct ApiError: Error, ErrorDescription {
    let data: Data?
    let httpUrlResponse: HTTPURLResponse
    var localizedDescription: String {
        let informationalMessage = "Status code: \(httpUrlResponse.statusCode)."
        switch httpUrlResponse.statusCode {
        case 100...199: return informationalMessage + " Informational response"
        case 300...399: return informationalMessage + " Redirection error"
        case 400...499: return informationalMessage + " Client error"
        case 500...599: return informationalMessage + " Server error"
        default: return informationalMessage + " Unknown error"
        }
    }
}
