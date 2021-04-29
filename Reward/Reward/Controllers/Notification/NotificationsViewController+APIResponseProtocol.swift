//
//  NotificationsViewController+APIResponseProtocol.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

extension NotificationsViewController: APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest) {
        Loader.shared.hide()
        tableView.endRefreshing()
        if !response.shouldAppendListArray() {
            notificationListObject.notificationsList.removeAll()
        }
        let list = response.toObject(type: NotificationListModel.self).notificationsList.excludedObjects()
        notificationListObject.notificationsList.append(objectsIn: list)
        apiParameters = response.getMetaDataDetails(apiParameters: apiParameters)
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}
