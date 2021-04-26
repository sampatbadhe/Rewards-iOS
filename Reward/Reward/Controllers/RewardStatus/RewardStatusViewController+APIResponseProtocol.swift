//
//  RewardStatusViewController+APIResponseProtocol.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

extension RewardStatusViewController: APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest) {
        Loader.shared.hide()
        tableView.endRefreshing()
        rewardDetailsList.rewardList.removeAll()
        rewardDetailsList.rewardList = response.toObject(type: RewardListModel.self).rewardList
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}
