//
//  APIHeaderKey.swift
//  Reward
//
//  Created by Keval Vadoliya on 06/04/21.
//

import Foundation
import Alamofire

public enum APIHeaderKey {
    case accessToken
    case contentTypeUrlEncoded
    case json
    
    public var header: HTTPHeader {
        switch self {
        case .accessToken:
            return HTTPHeader(name: "Authorization", value: "")
        case .contentTypeUrlEncoded:
            return HTTPHeader(name: "Content-Type", value: "application/x-www-form-urlencoded")
        case .json:
            return HTTPHeader(name: "Content-Type", value: "application/json")
        }
    }
}
