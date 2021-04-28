//
//  NotificationViewController.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

class NotificationViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    
    var apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.notifications
        apiManager.delegate = self
//        setTableView()
    }
    
    func setTableView() {
        tableView.isHidden = true
        tableView.refreshControlAction = { sender in
            self.callNotificationAPI()
        }
    }
    
    func callNotificationAPI() {
        Loader.shared.show()
        apiManager.callAPI(request: notificationAPIRequest())
    }
    
    func notificationAPIRequest() -> APIRequest {
        return APIRequest(url: APIUrlStruct(apiPath: .v1, apiUrl: .notification))
    }

}
