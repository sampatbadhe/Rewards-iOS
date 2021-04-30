//
//  Common.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

class Common {
    
    class func getStatusColor(status: String?) -> UIColor? {
        switch status {
        case "pending": return R.color.orange()
        case "approved": return R.color.green()
        case "rejected": return R.color.red()
        case "withdrawn": return R.color.silver()
        default: return UIColor.black
        }
    }
    
}
