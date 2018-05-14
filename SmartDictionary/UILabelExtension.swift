//
//  UILabelExtension.swift
//  SmartDictionary
//
//  Created by Bogdan on 14.05.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

extension UILabel {
    func animateAdding(_ duration: Double, newText: String) {
        iterateAdding(newText as NSString, index: 0, delay: duration / Double(newText.count))
    }
    
    private func iterateAdding(_ text: NSString, index: Int, delay: Double) {
        let substring = text.substring(to: index)
        self.text = substring
        
        if text as String != substring {
            let time = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            
            DispatchQueue.main.asyncAfter(deadline: time) {
                self.iterateAdding(text, index: index + 1, delay: delay)
            }
        }
    }
}
