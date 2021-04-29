//
//  SnackbarEnums.swift
//  Reward
//
//  Created by Keval Vadoliya on 30/04/21.
//

import Foundation
import UIKit

public enum SnackbarType {
    
    case info
    
    public var color: UIColor {
        switch self {
        case .info: return R.color.background() ?? .black
        }
    }
}

public enum SnackbarMessage {
    
    case custom(message: String)
    case somethingWentWrong
    case selectCategory
    case selectReason
    case selectCategoryFirst
    case additionalComment
    
    public var description: String {
        switch self {
        case .custom(message: let value): return value
        case .somethingWentWrong: return "Something went wrong"
        case .selectCategory: return "Please select the category"
        case .selectReason: return "Please select the reason"
        case .selectCategoryFirst: return "Please select the category first"
        case .additionalComment: return "Additional comment required for this reason"
        }
    }

}
