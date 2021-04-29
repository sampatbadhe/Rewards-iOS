//
//  CommonExtensions.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit
import ObjectMapper

extension CustomDateFormatTransform {
    
    convenience init(format: DateTimeFormat) {
        self.init(formatString: format.rawValue)
    }
    
}
