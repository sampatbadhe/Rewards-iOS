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
        setSegmentBarUI()
        setTableView()
        apiParameters.reset()
        callRewardStatusAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
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
    
    func callWithdrawnRewardAPI(id: Int) {
        Loader.shared.show()
        apiManager.callAPI(request: withdrawnRewardAPIRequest(id: id))
    }
    
    func withdrawnRewardAPIRequest(id: Int) -> APIRequest {
        return APIRequest(
            url: APIUrlStruct(apiPath: .v1, apiUrl: .rewards, withdrawnId: id),
            parameters: [APIKeys.reward: [APIKeys.Rewards.status: "withdrawn"]],
            method: .put)
    }
    
    func getRewardStatusParameters() -> [String: Any] {
        var parameters = [String: Any]()
        parameters[APIKeys.Rewards.status] = statusSegment.selectedSegmentIndex == 0 ? Constants.Reward.pending : Constants.Reward.notPending
        if !showAll {
            parameters[APIKeys.Rewards.categoryId] = categoryId
        }
        apiParameters.toParameters(parameters: &parameters)
        return parameters
    }
    
    @IBAction func changeStatusTypeAction(_ sender: UISegmentedControl) {
        self.apiParameters.reset()
        self.callRewardStatusAPI()
    }
    
    func withdrawnAlertView(index: Int) {
        let alertView = UIAlertController(
            title: Constants.AlertTitle.withdrawn,
            message: Constants.AlertMessage.withdrawnConfirmationMessage,
            preferredStyle: .alert)
        let noAction = UIAlertAction(title: Constants.AlertTitle.no, style: .cancel, handler: nil)
        let yesAction = UIAlertAction(title: Constants.AlertTitle.yes, style: .default) { (_) in
            self.callWithdrawnRewardAPI(id: self.rewardDetailsList.rewardList[index].id)
        }
        alertView.addAction(noAction)
        alertView.addAction(yesAction)
        present(alertView, animated: true, completion: nil)
    }
    
    func handleWithdrawn(index: Int) {
        withdrawnAlertView(index: index)
    }
    
}
