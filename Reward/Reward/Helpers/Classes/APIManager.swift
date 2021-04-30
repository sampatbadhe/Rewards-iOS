//
//  APIManager.swift
//  Reward
//
//  Created by Keval Vadoliya on 06/04/21.
//

import Foundation
import Alamofire
import GoogleSignIn

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
        case HTTPStatus.success, HTTPStatus.created:
            callSuccessDelegateMethod(response, statusCode: statusCode, request: request)
        case HTTPStatus.unAuthorized, HTTPStatus.invalidToken:
            callRefreshTokenAPI(request: request)
        default:
            handleAPIFailure(response, failureCode: statusCode, request: request)
        }
    }
    
    private func callRefreshTokenAPI(request: APIRequest) {
        AF.sessionConfiguration.timeoutIntervalForRequest = GlobalSettings.timeoutIntervalForRequest
        AF.request(
            APIUrlStruct(apiPath: .v1, apiUrl: .token).toString(),
            method: .post,
            parameters: CommonUtility().currentUserParameters(),
            encoding: URLEncoding.default,
            headers: [APIHeaderKey.contentTypeUrlEncoded.header]).responseJSON { response in
                self.handleTokenResponse(response: response, request: request)
            }
    }
    
    private func handleTokenResponse(response: AFDataResponse<Any>, request: APIRequest) {
        if let responseData = response.value as? [String: Any], !responseData.isEmpty, let token = responseData["token"] as? String {
            Variable.token = token
            callAPI(request: request)
        } else {
            Loader.shared.hide()
            Snackbar.shared.show(message: .somethingWentWrong)
        }
    }

    private func callSuccessDelegateMethod(_ response: AFDataResponse<Any>, statusCode: Int, request: APIRequest) {
        if let responseData = response.value as? [String: Any] {
            if responseData.isEmpty {
                Loader.shared.hide()
                Snackbar.shared.show(message: .somethingWentWrong)
                return
            }
            delegate?.successResponse(responseData, successCode: HTTPStatus.success, request: request)
        }
    }
    
   private func handleAPIFailure(_ response: AFDataResponse<Any>?, failureCode: Int, request: APIRequest) {
        if !shouldCallFailureMethod {
            Loader.shared.hide()
            Snackbar.shared.show(message: .somethingWentWrong)
        }
        delegate?.failureResponse(response, failureCode: failureCode, request: request)
   }
    
}
