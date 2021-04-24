//
//  SettingsViewController+TableViewExtension.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit
import GoogleSignIn

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if settingList[indexPath.row].title == Setting.Title.logout {
            GIDSignIn.sharedInstance()?.signOut()
            dismiss(animated: true, completion: nil)
        }        
    }
    
}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profileCell = tableView.dequeueReusableCell(withClass: ProfileInfoCell.self)
        return profileCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingCell = tableView.dequeueReusableCell(withClass: SettingCell.self, for: indexPath)
        settingCell.configureWithModel(settingInfo: settingList[indexPath.row], index: indexPath.row)
        return settingCell
    }
    
}
