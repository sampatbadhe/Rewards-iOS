//
//  Dashboard.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import Foundation

enum Dashboard: Int, CaseIterable {
    case top3Contributors = 0
    case HeroesOfTheMonth = 1
    case overallStats = 2
    
    public var title: String {
        switch self {
        case .top3Contributors:
            return "Top Contributors"
        case .HeroesOfTheMonth:
            return "Heroes Of The Last Month"
        case .overallStats:
            return "Overall Stats"
        }
    }
}
