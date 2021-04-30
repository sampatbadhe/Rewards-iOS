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
        if let rewardDetail = response["reward"] as? RewardModel,
           let index = rewardDetailsList.rewardList.firstIndex(where: { (object) -> Bool in
            object.id == rewardDetail.id
           }) {
            rewardDetailsList.rewardList.remove(at: index)
            tableView.isHidden = false
            tableView.reloadData()
            return
        }
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
