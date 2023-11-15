//
//  String+Utils.swift
//  Appetizers_SwiftUI
//
//  Created by Elizabeth Nikolova on 10/26/23.
//

import Foundation
import RegexBuilder

extension String {
    var isValidEmail: Bool {
        if #available(iOS 16.0, *) {
            let emailRegex = Regex {
                OneOrMore {
                    CharacterClass(
                        .anyOf("._%+-"),
                        ("A"..."Z"),
                        ("0"..."9"),
                        ("a"..."z")
                    )
                }
                "@"
                OneOrMore {
                    CharacterClass(
                        .anyOf("-"),
                        ("A"..."Z"),
                        ("a"..."z"),
                        ("0"..."9")
                    )
                }
                "."
                Repeat(2...64) {
                    CharacterClass(
                        ("A"..."Z"),
                        ("a"..."z")
                    )
                }
            }
            return wholeMatch(of: emailRegex) != nil
        }
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        
        return emailPredicate.evaluate(with: self)
    }
}
