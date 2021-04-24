//
//  SettingViewController.swift
//  Reward
//
//  Created by Darshan on 18/04/21.
//

import UIKit
import SwifterSwift
import GoogleSignIn

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    
    var settingsList = [SettingInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NavigationTitle.settings
        getSettingList()
    }
    
    func getSettingList() {
        settingsList.removeAll()
        settingsList.append(SettingInfo(title: Setting.Title.notification, image: R.image.notifications()))
        settingsList.append(SettingInfo(title: Setting.Title.logout, image: R.image.logout()))
    }
    
}

extension SettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 2 {
            return
        }
        GIDSignIn.sharedInstance()?.signOut()
        navigationController?.popViewController()
    }
    
}

extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let profileCell = tableView.dequeueReusableCell(indexPath: indexPath, type: ProfileInfoCell.self)
            return profileCell
        } else {
            let settingCell = tableView.dequeueReusableCell(indexPath: indexPath, type: SettingCell.self)
            settingCell.configureWithModel(index: indexPath.row, settingInfo: settingsList[indexPath.row - 1])
            return settingCell
        }
    }
    
}
