//
//  MyViewViewController+APIResponseProtocol.swift
//  Reward
//
//  Created by Darshan on 26/04/21.
//

import UIKit

extension MyViewViewController: APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest) {
        Loader.shared.hide()
        tableView.endRefreshing()
        switch request.url.endPoint {
        case .myView:
            guard let myViewDetails = response.toObject(type: MyViewModel.self).myView else {
                return
            }
            categoryBadgeDetails = myViewDetails.categoryByBadges
            badgeTallyDetails = myViewDetails.badgesTally ?? BadgesTallyModel()
            tableView.isHidden = false
            tableView.reloadData()
        case .categoryReasons:
            categoryReasonDetails.categoryReasonList = response.toObject(type: CategoryReasonListModel.self).categoryReasonList
            RealmManager.shared.add(object: categoryReasonDetails, shouldUpdate: false)
        default:
            break
        }
        
        
    }
    
}
