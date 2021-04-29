//
//  DashboardViewController.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    var apiManager = APIManager()
    var dashboardObject = DashboardModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.NavigationTitle.dashboard
        apiManager.delegate = self
        configureTableView()
        callDashboardAPI()
    }
    
    func configureTableView() {
        tableView.isHidden = true
        tableView.refreshControlAction = { sender in
            self.callDashboardAPI()
        }
    }
    
    func callDashboardAPI() {
        Loader.shared.show()
        apiManager.callAPI(request: dashboardAPIRequest())
    }
    
    func dashboardAPIRequest() -> APIRequest {
        return APIRequest(url: APIUrlStruct(apiPath: .v1, apiUrl: .dashboard))
    }

}
