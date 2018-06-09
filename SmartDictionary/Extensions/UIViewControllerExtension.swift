//
//  UIViewControllerExtension.swift
//  SmartDictionary
//
//  Created by Bogdan on 05.06.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
    static func loadFromStoryboard() -> Self
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }

    static func loadFromStoryboard() -> Self {
        let storyboard = UIStoryboard(storyboard: .main)

        guard let vc = storyboard.instantiateViewController(withIdentifier: Self.storyboardIdentifier) as? Self else {
            fatalError("UIStoryboardLoadable: can not load viewcontroller with identifier '\(self.storyboardIdentifier)' from storyboard.")
        }
        return vc
    }
}
