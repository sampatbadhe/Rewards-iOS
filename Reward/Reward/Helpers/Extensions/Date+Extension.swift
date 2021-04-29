//
//  Date+Extension.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

extension Date {
    
    func getElapsedInterval() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
}
