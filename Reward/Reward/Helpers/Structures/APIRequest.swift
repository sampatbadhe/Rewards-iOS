//
//  APIRequest.swift
//  Reward
//
//  Created by Keval Vadoliya on 06/04/21.
//

import Foundation
import Alamofire

public struct APIRequest {
    
    var headers: [APIHeaderKey] = []
    var url: APIUrlStruct
    var parameters: [String: Any]
    var method: HTTPMethod = .get
    var encoding: ParameterEncoding = URLEncoding.default
    
    init(
        headers: [APIHeaderKey] = [.accessToken, .contentTypeUrlEncoded],
        url: APIUrlStruct = APIUrlStruct(),
        parameters: [String: Any] = [String: Any](),
        method: HTTPMethod = .get,
        encoding: ParameterEncoding = URLEncoding.default) {
        self.headers = headers
        self.url = url
        self.parameters = parameters
        self.method = method
        self.encoding = encoding
    }
    
}
