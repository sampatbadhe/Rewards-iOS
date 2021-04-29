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
            self.handleDelete(index: indexPath.row)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "arrow.uturn.left")
        let editAction = UIContextualAction(style: .normal, title: String()) { (action, view, completionHandler) in
            self.handleEdit(index: indexPath.row)
            completionHandler(true)
        }
        editAction.image = UIImage(systemName: "highlighter")
        editAction.backgroundColor = R.color.purple()
        return UISwipeActionsConfiguration(actions: statusSegment.selectedSegmentIndex == 0 ? [deleteAction, editAction] : [])
    }
    
}

extension RewardStatusViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rewardDetailsList.rewardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: RewardDetailCell.self, for: indexPath)
        cell.configureWithModel(rewardDetail: rewardDetailsList.rewardList[indexPath.row])
        return cell
    }
    
}
