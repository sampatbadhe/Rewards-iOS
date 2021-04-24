//
//  APIResponseProtocol.swift
//  Reward
//
//  Created by Keval Vadoliya on 06/04/21.
//

import UIKit
import Alamofire

protocol APIResponseProtocol: class {

    func successResponse(_ response: [String: Any], successCode: Int, apiName: APIUrl)

    func failureResponse(_ response: AFDataResponse<Any>?, failureCode: Int, apiName: APIUrl)

}

extension APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, apiName: APIUrl) {
        
    }
    
    func failureResponse(_ response: AFDataResponse<Any>?, failureCode: Int, apiName: APIUrl) {
        
    }
}
