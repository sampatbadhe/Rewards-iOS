//
//  RewardStatusViewController.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

class RewardStatusViewController: UIViewController {

    @IBOutlet weak var statusSegment: UISegmentedControl!
    @IBOutlet weak var tableView: CustomTableView!
    
    let apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.rewardStatus
        apiManager.delegate = self
        setNavigationBarButton()
        setSegmentBarUI()
        setTableView()
        callRewardStatusAPI()
    }
    
    func setNavigationBarButton() {
        let filterBarButton = UIBarButtonItem(image: UIImage(systemName: "slider.vertical.3"), style: .plain, target: self, action: #selector(filterAction(_:)))
        navigationItem.rightBarButtonItem = filterBarButton
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setSegmentBarUI() {
        statusSegment.setTitle("Pending", forSegmentAt: 0)
        statusSegment.setTitle("History", forSegmentAt: 1)
    }
    
    func setTableView() {
        tableView.isHidden = true
        tableView.refreshControlAction = { sender in
            self.callRewardStatusAPI()
        }
    }
    
    func callRewardStatusAPI() {
        Loader.shared.show()
        apiManager.callAPI(request: rewardStatusAPIRequest())
    }
    
    func rewardStatusAPIRequest() -> APIRequest {
        return APIRequest(
            url: APIUrlStruct(apiPath: .v1, apiUrl: .rewards),
            parameters: ["status": statusSegment.selectedSegmentIndex == 0 ? "pending" : "not_pending"])
    }

    @IBAction func filterAction(_ sender: UIBarButtonItem) {
        // Open filter screen
    }
    
    @IBAction func changeStatusTypeAction(_ sender: UISegmentedControl) {
        self.callRewardStatusAPI()
    }
    
}
