//
//  SignInViewController+APIResponseProtocol.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit

extension SignInViewController: APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, apiName: APIUrl) {
        switch apiName {
        case .token:
            guard let token = response["token"] as? String else {
                return
            }
            Variable.token = token
            callProfileAPI()
        case .profile:
            Common.hideLoader()
            guard let profile = response["user"] as? [String: Any] else {
                return
            }
            let userDetail = profile.toObject(type: UserProfileModel.self)
            print(userDetail)
            RealmManager.shared.add(object: userDetail)
        }
        
        
    }
    
}
