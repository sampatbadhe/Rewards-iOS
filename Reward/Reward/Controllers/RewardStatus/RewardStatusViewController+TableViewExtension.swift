//
//  RewardStatusViewController+TableViewExtension.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

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
