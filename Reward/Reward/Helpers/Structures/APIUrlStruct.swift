//
//  APIURLStruct.swift
//  Reward
//
//  Created by Keval Vadoliya on 06/04/21.
//

import Foundation

struct APIUrlStruct {
    
    var apiPath: APIPath
    var endPoint: APIUrl
    var withdrawnId: Int?
       
    init(apiPath: APIPath = .noPath, apiUrl: APIUrl = .token) {
        self.apiPath = apiPath
        self.endPoint = apiUrl
    }
    
    init(apiPath: APIPath = .noPath, apiUrl: APIUrl = .token, withdrawnId: Int?) {
        self.apiPath = apiPath
        self.endPoint = apiUrl
        self.withdrawnId = withdrawnId
    }
    
    func toString() -> String {
        if withdrawnId != nil {
            return Environment().configuration() + apiPath.rawValue + endPoint.rawValue + "/" + withdrawnId.toString
        }
        return Environment().configuration() + apiPath.rawValue + endPoint.rawValue
    }
    
}
