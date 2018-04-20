//
//  NetworkingManager.swift
//  SmartDictionary
//
//  Created by Bogdan on 20.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingManager {
    func translate(word: String, complition: () -> ()) {
        let urlRequest = try! APIRequest.translate(word: word).asURLRequest()
        Alamofire.request(urlRequest).responseJSON { (response) in
            
        }
    }
}
