//
//  SettingsViewController.swift
//  Reward
//
//  Created by Darshan on 18/04/21.
//

import UIKit
import SwifterSwift

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    
    var settingList = [SettingInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NavigationTitle.settings
        getSettingList()
    }
    
    func getSettingList() {
        settingList.removeAll()
        settingList.append(SettingInfo(title: Setting.Title.notifications, image: R.image.notifications()))
        settingList.append(SettingInfo(title: Setting.Title.logout, image: R.image.logout(), switchVisibility: false))
    }
    
}
