//
//  AppGlobalEnums.swift
//  Reward
//
//  Created by Darshan on 26/04/21.
//

import UIKit

public enum CategoryTypeId: Int {
    
    case kfc = 6
    case coe = 7
    case hiring = 8
    case referral = 9
    case others = 10
    
    public var title: String {
        switch self {
        case .kfc: return "KFC"
        case .coe: return "COE"
        case .hiring: return "Hiring"
        case .referral: return "Referral"
        case .others: return "Others"
        }
    }
    
}


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

public enum DateTimeFormat: String {
    case date = "yyyy-MM-dd"
    case dateWithMillisecondAndTimeZone = "yyyy-MM-dd'T'HH:mm:ss.SZ"
}


