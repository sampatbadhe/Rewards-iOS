//
//  APIManager.swift
//  Reward
//
//  Created by Keval Vadoliya on 06/04/21.
//

import Foundation
import Alamofire

class APIManager {
    
    weak var delegate: APIResponseProtocol?
    var shouldCallFailureMethod = false
    
    func callAPI(request: APIRequest) {
        let headers = HTTPHeaders(request.headers.compactMap { $0.header })
        AF.sessionConfiguration.timeoutIntervalForRequest = GlobalSettings.timeoutIntervalForRequest
        AF.request(
            request.url.toString(),
            method: request.method,
            parameters: request.parameters,
            encoding: request.encoding,
            headers: headers).responseJSON { response in
                self.handleAPIResponse(response: response, request: request)
            }
    }
    
    func handleAPIResponse(response: AFDataResponse<Any>, request: APIRequest) {
        let statusCode = response.response?.statusCode ?? Int()
        switch statusCode {
        case HTTPStatus.success:
            callSuccessDelegateMethod(response, statusCode: statusCode, request: request)
        default:
            handleAPIFailure(response, failureCode: statusCode, request: request)
        }
    }

    private func callSuccessDelegateMethod(_ response: AFDataResponse<Any>, statusCode: Int, request: APIRequest) {
        if let responseData = response.value as? [String: Any] {
            if responseData.isEmpty {
                // Handle error
                return
            }
            delegate?.successResponse(responseData, successCode: HTTPStatus.success, request: request)
        }
    }
    
   private func handleAPIFailure(_ response: AFDataResponse<Any>?, failureCode: Int, request: APIRequest) {
        if !shouldCallFailureMethod {
            // Handle error
        }
        delegate?.failureResponse(response, failureCode: failureCode, request: request)
   }
    
}
