//
//  NotificationViewController+TableViewExtension.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

extension NotificationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: NotificationCell.self, for: indexPath)
        cell.configureWithModel()
        return cell
    }
}
