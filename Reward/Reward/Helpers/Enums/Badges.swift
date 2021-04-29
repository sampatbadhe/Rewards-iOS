//
//  Badges.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit

enum Badges: CaseIterable {
    case gold
    case silver
    case bronze
    
    public var title: String {
        switch self {
        case .gold:
            return "Gold"
        case .silver:
            return "Silver"
        case .bronze:
            return "Bronze"
        }
    }
    
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
    
}
