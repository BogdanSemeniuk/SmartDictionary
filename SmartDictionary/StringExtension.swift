//
//  StringExtension.swift
//  SmartDictionary
//
//  Created by Bogdan on 28.04.2018.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

extension String {
    /*
     Takes the current String struct and strips out HTML using regular expression. All tags get stripped out.
     :returns: String html text as plain text
     */
    func stripHTML() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil).replacingOccurrences(of: "&quot;", with: "\u{0022}").replacingOccurrences(of: "[i]", with: "'").replacingOccurrences(of: "[/i]", with: "'").replacingOccurrences(of: "&#39;", with: "'")
    }
}
