//
//  Common.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

class Common {
    
    class func getStatusColor(status: String?) -> UIColor {
        switch status {
        case "pending": return UIColor.systemOrange
        case "approved": return UIColor.systemGreen
        case "rejected": return UIColor.systemRed
        case "withdrawn": return UIColor.systemGray3
        default: return UIColor.black
        }
    }
    
}
