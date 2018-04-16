//
//  Navigator.swift
//  SmartDictionary
//
//  Created by Bogdan on 16.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

protocol Navigator {
    associatedtype Destination
    func navigate(to destination: Destination)
}
