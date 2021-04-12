//
//  APIResponseProtocol.swift
//  Reward
//
//  Created by Keval Vadoliya on 06/04/21.
//

import UIKit
import Alamofire

protocol APIResponseProtocol: class {

    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest)

    func failureResponse(_ response: AFDataResponse<Any>?, failureCode: Int, request: APIRequest)

}

extension APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest) {
        
    }
    
    func failureResponse(_ response: AFDataResponse<Any>?, failureCode: Int, request: APIRequest) {
        
    }
}
