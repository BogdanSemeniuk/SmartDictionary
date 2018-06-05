//
//  UIViewExtension.swift
//  SmartDictionary
//
//  Created by Bogdan on 28.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable
    public var viewCornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }get {
            return self.layer.cornerRadius
        }
    }

}
