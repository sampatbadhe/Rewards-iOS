//
//  Int+Extension.swift
//  Reward
//
//  Created by Darshan on 26/04/21.
//

import UIKit

extension Int {
    
    var toString: String {
        return String(describing: self)
    }

    var ordinal: String {
        get {
            var suffix = "th"
            switch self % 10 {
            case 1:
                suffix = "st"
            case 2:
                suffix = "nd"
            case 3:
                suffix = "rd"
            default: ()
            }
            if 10 < (self % 100) && (self % 100) < 20 {
                suffix = "th"
            }
            return String(self) + suffix
        }
    }
    
}

extension Optional where Wrapped == Int {
    
    var toString: String {
        let value = self ?? 0
        return value.toString
    }
    
}
