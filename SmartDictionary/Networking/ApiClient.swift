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
    func execute(request: URLRequestConvertible)
}

class ApiClientImplementation: ApiClient {
    func execute(request: URLRequestConvertible) {
        Alamofire.request(request)
    }
}
