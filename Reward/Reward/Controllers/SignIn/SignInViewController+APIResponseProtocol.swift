//
//  SignInViewController+APIResponseProtocol.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit

extension SignInViewController: APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest) {
        switch request.url.endPoint {
        case .token:
            guard let token = response["token"] as? String else {
                return
            }
            Variable.token = token
            callProfileAPI()
        case .profile:
            Loader.shared.hide()
            guard let profile = response["user"] as? [String: Any] else {
                return
            }
            let userDetails = profile.toObject(type: UserProfileModel.self)
            RealmManager.shared.add(object: userDetails)
            Redirect().toMainScreen()
        }
    }
    
}
