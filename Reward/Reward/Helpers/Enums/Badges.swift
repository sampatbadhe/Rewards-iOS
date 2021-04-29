//
//  Badges.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit

enum Badges: String {
    case gold = "gold"
    case silver = "silver"
    case bronze = "bronze"
    
    public var color: UIColor {
        switch self {
        case .bronze:
            return R.color.bronze() ?? .clear
        case .gold:
            return R.color.gold() ?? .clear
        case .silver:
            return R.color.silver() ?? .clear
        }
    }
    
    public var image: UIImage? {
        switch self {
        case .bronze:
            return R.image.bronze()
        case .gold:
            return R.image.gold()
        case .silver:
            return R.image.silver()
        }
    }
    
}
