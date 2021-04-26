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
        guard let myViewDictionary = response["my_view"] as? [String: Any],
              let teamCategoryResponse = myViewDictionary["badges_by_category"] as? [String: Any],
              let medalCategoryResponse = myViewDictionary["badges_tally"] as? [String: Any] else {
            return
        }
        teamCategoryDetails = teamCategoryResponse.toObject(type: TeamCategoryModel.self)
        medalCategoryDetails = medalCategoryResponse.toObject(type: MedalCategoryModel.self)
        getTeamListDetails()
        tableView.isHidden = false
        tableView.reloadData()
    }
    
}
