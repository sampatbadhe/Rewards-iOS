//
//  MyViewViewController+TableViewExtension.swift
//  Reward
//
//  Created by Darshan on 26/04/21.
//

import UIKit

extension MyViewViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withClass: MedalHeaderCell.self)
        headerCell.configureWithModel(medalDetails: medalCategoryDetails)
        headerCell.allStatusAction = { sender in
            self.openRewardStatusView()
        }
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openRewardStatusView(showAll: false)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension MyViewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: TeamListCell.self, for: indexPath)
        cell.configureWithModel(teamDetails: teamList[indexPath.row])
        return cell
    }
    
}
