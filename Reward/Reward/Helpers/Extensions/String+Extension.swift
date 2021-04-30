//
//  String+Extension.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

extension Optional where Wrapped == String {
    
    var optionalValue: String {
        guard let value = self, !value.isEmpty else {
            return "-"
        }
        return value
    }
    
}

extension String {
    
    var optionalValue: String {
        guard !self.isEmpty else {
            return "-"
        }
        return self
    }
    
}
