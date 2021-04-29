//
//  NotificationsViewController+TableViewExtension.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

extension NotificationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationListObject.notificationsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: NotificationCell.self, for: indexPath)
        cell.configureWithModel(notification: notificationListObject.notificationsList[indexPath.row])
        if indexPath.row == notificationListObject.notificationsList.count - 1 {
            callNotificationAPI()
        }
        return cell
    }
}
