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
        print(response)
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}
