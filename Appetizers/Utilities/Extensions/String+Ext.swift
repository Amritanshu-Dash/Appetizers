//
//  String+Ext.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 11/06/24.
//

import Foundation
import RegexBuilder

extension String {
    
    var isValidEmail: Bool {
        
//        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" ->change it to this-> /[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}/ then right click refactor to regex
//        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
//        
//        return emailPredicate.evaluate(with: self)
        
        // ios 16 supports regex that means swift 5.7 onwards regex support started
        
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
        //checks if the passed string is legal then returns the regex check value as an optional
        return self.wholeMatch(of: emailRegex) != nil // if not nil then true else false
    }
    
}
