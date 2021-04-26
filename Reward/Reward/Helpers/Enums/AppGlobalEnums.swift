//
//  AppGlobalEnums.swift
//  Reward
//
//  Created by Darshan on 26/04/21.
//

import UIKit

public enum TeamType: CaseIterable {
    
    case coe
    case hiring
    case kfc
    case others
    case referral
        
    public var title: String {
        switch self {
        case .coe: return "COE"
        case .hiring: return "Hiring"
        case .kfc: return "KFC"
        case .others: return "Others"
        case .referral: return "Referral"
        }
    }
    
}

