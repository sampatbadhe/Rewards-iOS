//
//  APIParametersStruct.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

struct APIParameters {
    
    var currentPage = 1
    var perPage = 20
    var shouldCallNext = true
    
    mutating func reset() {
        currentPage = 1
        shouldCallNext = true
    }
    
    func toParameters(parameters: inout [String: Any]) {
        parameters[APIKeys.currentPage] = currentPage
        parameters[APIKeys.perPage] = perPage
    }

}
