//
//  ApiResponse.swift
//  SmartDictionary
//
//  Created by Bogdan on 25.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

struct ApiResponse<T: InitializableWithData> {
    let entity: T
    let httpUrlResponse: HTTPURLResponse
    let data: Data?
    
    init(data: Data?, httpUrlResponse: HTTPURLResponse) throws {
        do {
            self.entity = try T(data: data)
            self.httpUrlResponse = httpUrlResponse
            self.data = data
        } catch {
            throw ParseError()
        }
    }
}
