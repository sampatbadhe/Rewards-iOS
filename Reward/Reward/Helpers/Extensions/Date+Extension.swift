//
//  Date+Extension.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import Foundation

extension Optional where Wrapped == Date {
    
    func toString(format: String = "MMM yyyy") -> String {
        guard let date = self else {
            return String()
        }
        return date.toString(format: format)
    }

}

extension Date {

    func toString(format: String = "MMM yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)

    }
    
}
