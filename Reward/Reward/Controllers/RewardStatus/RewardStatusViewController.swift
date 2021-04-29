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
    var apiParameters = APIParameters()
    var rewardDetailsList = RewardListModel()
    var showAll: Bool = false
    var categoryId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.rewardStatus
        apiManager.delegate = self
        setNavigationBarButton()
        setSegmentBarUI()
        setTableView()
        apiParameters.reset()
        callRewardStatusAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func setNavigationBarButton() {
        let filterBarButton = UIBarButtonItem(image: UIImage(systemName: "slider.vertical.3"), style: .plain, target: self, action: #selector(filterAction(_:)))
        navigationItem.rightBarButtonItem = filterBarButton
    }
    
    func setSegmentBarUI() {
        statusSegment.setTitle("Pending Rewards", forSegmentAt: 0)
        statusSegment.setTitle("Rewards History", forSegmentAt: 1)
    }
    
    func setTableView() {
        tableView.isHidden = true
        tableView.refreshControlAction = { sender in
            self.apiParameters.reset()
            self.callRewardStatusAPI()
        }
    }
    
    func callRewardStatusAPI() {
        if !apiParameters.shouldCallNext {
            return
        }
        Loader.shared.show()
        apiManager.callAPI(request: rewardStatusAPIRequest())
    }
    
    func rewardStatusAPIRequest() -> APIRequest {
        return APIRequest(
            url: APIUrlStruct(apiPath: .v1, apiUrl: .rewards),
            parameters: getRewardStatusParameters())
    }
    
    func getRewardStatusParameters() -> [String: Any] {
        var parameters = [String: Any]()
        parameters["status"] = statusSegment.selectedSegmentIndex == 0 ? "pending" : "not_pending"
        if !showAll {
            parameters["category_id"] = categoryId
        }
//        for Date Filter parameter
//        start_date
//        end_date
        apiParameters.toParameters(parameters: &parameters)
        return parameters
    }

    @IBAction func filterAction(_ sender: UIBarButtonItem) {
        guard let filterViewController = UIStoryboard.main?.instantiateViewController(withClass: FilterViewController.self) else {
            return
        }
        navigationController?.pushViewController(filterViewController, animated: true)
    }
    
    @IBAction func changeStatusTypeAction(_ sender: UISegmentedControl) {
        self.apiParameters.reset()
        self.callRewardStatusAPI()
    }
    
    func handleDelete(index: Int) {
        print("Marked as Deleted")
    }
    
    func handleEdit(index: Int) {
        print("Marked as Edited")
    }
    
}
