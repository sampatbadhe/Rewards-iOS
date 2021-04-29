//
//  SettingsViewController.swift
//  Reward
//
//  Created by Darshan on 18/04/21.
//

import UIKit
import SwifterSwift
import GoogleSignIn

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    
    var settingList = [SettingInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.NavigationTitle.settings
        getSettingList()
    }
    
    func getSettingList() {
        settingList.removeAll()
        settingList.append(SettingInfo(title: Constants.Setting.notifications, image: R.image.notifications()))
        settingList.append(SettingInfo(title: Constants.Setting.logout, image: R.image.logout(), switchVisibility: false))
    }
    
    func logoutAlertView() {
        let alertView = UIAlertController(
            title: Constants.AlertTitle.logout,
            message: Constants.AlertMessage.logoutConfirmationMessage,
            preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Constants.AlertTitle.cancel, style: .cancel, handler: nil)
        let logoutAction = UIAlertAction(title: Constants.AlertTitle.logout, style: .default) { (_) in
            RealmManager.shared.deleteAll()
            GIDSignIn.sharedInstance()?.signOut()
            Redirect().toSignInScreen(self.view.window)
        }
        alertView.addAction(cancelAction)
        alertView.addAction(logoutAction)
        present(alertView, animated: true, completion: nil)
    }
    
}
