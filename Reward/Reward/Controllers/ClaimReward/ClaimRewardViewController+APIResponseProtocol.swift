//
//  ClaimRewardViewController+APIResponseProtocol.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

extension ClaimRewardViewController: APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest) {
        Loader.shared.hide()
        switch request.url.endPoint {
        case .categoryReasons:
            categoryReasonsObject = response.toObject(type: CategoryReasonListModel.self)
        case .rewards:
            print(response)
            dismiss(animated: true, completion: nil)
        default:
            break
        }
        
        
    }
    
}
