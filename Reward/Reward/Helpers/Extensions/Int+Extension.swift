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
    
}

extension Optional where Wrapped == Int {
    
    var toString: String {
        let value = self ?? 0
        return value.toString
    }
    
}
