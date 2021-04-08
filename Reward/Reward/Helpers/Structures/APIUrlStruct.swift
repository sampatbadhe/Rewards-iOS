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
       
    init(apiPath: APIPath = .noPath, apiUrl: APIUrl = .token) {
        self.apiPath = apiPath
        self.endPoint = apiUrl
    }
    
    func toString() -> String {
        return Environment().configuration() + apiPath.rawValue + endPoint.rawValue
    }
    
}
