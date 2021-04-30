//
//  RewardStatusViewController+TableViewExtension.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

extension RewardStatusViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: String()) { (action, view, completionHandler) in
            self.handleWithdrawn(index: indexPath.row)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "arrow.uturn.left")
        return UISwipeActionsConfiguration(actions: statusSegment.selectedSegmentIndex == 0 ? [deleteAction] : [])
    }
    
}

extension RewardStatusViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rewardDetailsList.rewardList.isEmpty {
            tableView.setEmptyView()
            return 0
        }
        tableView.resetBackgroundView()
        return rewardDetailsList.rewardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: RewardDetailCell.self, for: indexPath)
        cell.configureWithModel(
            rewardDetail: rewardDetailsList.rewardList[indexPath.row],
            categoryReasonDetails: categoryReasonDetails)
        if indexPath.row == rewardDetailsList.rewardList.count - 1 {
            callRewardStatusAPI()
        }
        return cell
    }
    
}
