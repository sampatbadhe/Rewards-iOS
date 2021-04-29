//
//  NotificationsViewController.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    
    var apiManager = APIManager()
    var apiParameters = APIParameters()
    var notificationListObject = NotificationListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.notifications
        apiManager.delegate = self
        setTableView()
        apiParameters.reset()
        callNotificationAPI()
    }
    
    func setTableView() {
        tableView.isHidden = true
        tableView.refreshControlAction = { sender in
            self.apiParameters.reset()
            self.callNotificationAPI()
        }
    }
    
    func callNotificationAPI() {
        if !apiParameters.shouldCallNext {
            return
        }
        Loader.shared.show()
        apiManager.callAPI(request: notificationAPIRequest())
    }
    
    func notificationAPIRequest() -> APIRequest {
        var parameters = [String: Any]()
        apiParameters.toParameters(parameters: &parameters)
        return APIRequest(
            url: APIUrlStruct(apiPath: .v1, apiUrl: .notification),
            parameters: parameters)
    }
    
}
