//
//  UIStoryboardExtension.swift
//  SmartDictionary
//
//  Created by Bogdan on 05.06.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

extension UIStoryboard {

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }

    enum Storyboard: String {
        case main

        var filename: String {
            return rawValue.capitalized
        }
    }
}
