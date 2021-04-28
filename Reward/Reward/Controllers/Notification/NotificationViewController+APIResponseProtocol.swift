//
//  NotificationViewController+APIResponseProtocol.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

extension NotificationViewController: APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest) {
        Loader.shared.hide()
        tableView.endRefreshing()
        // Handle notification response
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}
