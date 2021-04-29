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
        if !response.shouldAppendListArray() {
            rewardDetailsList.rewardList.removeAll()
        }
        let list = response.toObject(type: RewardListModel.self).rewardList.excludedObjects()
        rewardDetailsList.rewardList.append(objectsIn: list)
        apiParameters = response.getMetaDataDetails(apiParameters: apiParameters)
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}
