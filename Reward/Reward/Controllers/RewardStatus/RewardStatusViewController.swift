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
    var categoryReasonDetails = CategoryReasonListModel()
    var showAll: Bool = false
    var categoryId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.rewardStatus
        apiManager.delegate = self
        if showAll {
            setNavigationBarButton()
        }
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
        statusSegment.setTitle(Constants.Title.pendingRewards, forSegmentAt: 0)
        statusSegment.setTitle(Constants.Title.rewardsHistory, forSegmentAt: 1)
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
        parameters[APIKeys.Rewards.status] = statusSegment.selectedSegmentIndex == 0 ? Constants.Reward.pending : Constants.Reward.notPending
        if !showAll {
            parameters[APIKeys.Rewards.categoryId] = categoryId
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
