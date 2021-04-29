//
//  DashboardViewController+APIResponseProtocol.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import Foundation

extension DashboardViewController: APIResponseProtocol {
    
    func successResponse(_ response: [String: Any], successCode: Int, request: APIRequest) {
        Loader.shared.hide()
        tableView.endRefreshing()
        guard let dashboardDetails = response["dashboard"] as? [String: Any] else {
            return
        }
        dashboardObject = dashboardDetails.toObject(type: DashboardModel.self)
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}
