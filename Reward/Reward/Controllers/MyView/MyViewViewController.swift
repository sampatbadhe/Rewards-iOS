//
//  MyViewViewController.swift
//  Reward
//
//  Created by Darshan on 25/04/21.
//

import UIKit
import RealmSwift

class MyViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    @IBOutlet weak var medalView: UIView!
    @IBOutlet weak var medalBackgroundView: UIView!
    @IBOutlet weak var goldCountLabel: UILabel!
    @IBOutlet weak var silverCountLabel: UILabel!
    @IBOutlet weak var bronzeCountLabel: UILabel!
    @IBOutlet weak var allStatusButton: UIButton!
    
    let apiManager = APIManager()
    var categoryBadgeDetails = List<CategoryBadgesModel>()
    var badgeDetails = BadgesModel()
    var categoryReasonDetails = CategoryReasonListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.NavigationTitle.myView
        apiManager.delegate = self
        setNavigationBarButton()
        setUI()
        setTableView()
        callMyViewAPI()
        callCategoryReasonsAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.updateHeaderViewHeight()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.updateHeaderViewHeight()
    }
    
    func setNavigationBarButton() {
        let shareBarButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAction(_:)))
        navigationItem.rightBarButtonItem = shareBarButton
    }
    
    func setTableView() {
        tableView.isHidden = true
        tableView.refreshControlAction = { sender in
            self.callMyViewAPI()
        }
    }
    
    func setUI() {
        allStatusButton.setTitle(Constants.Title.checkMyRewardsStatus, for: .normal)
        goldCountLabel.font = goldCountLabel.font.bold
        silverCountLabel.font = silverCountLabel.font.bold
        bronzeCountLabel.font = bronzeCountLabel.font.bold
    }
    
    func setDetails() {
        goldCountLabel.text = badgeDetails.gold.toString
        silverCountLabel.text = badgeDetails.silver.toString
        bronzeCountLabel.text = badgeDetails.bronze.toString
        tableView.tableHeaderView = medalView
    }
    
    func callMyViewAPI() {
        Loader.shared.show()
        apiManager.callAPI(request: myViewAPIRequest())
    }
    
    func myViewAPIRequest() -> APIRequest {
        return APIRequest(url: APIUrlStruct(apiPath: .v1, apiUrl: .myView))
    }
    
    func callCategoryReasonsAPI() {
        apiManager.callAPI(request: categoryReasonsAPIRequest())
    }
    
    func categoryReasonsAPIRequest() -> APIRequest {
        return APIRequest(url: APIUrlStruct(apiPath: .v1, apiUrl: .categoryReasons))
    }
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        let sharingText = "Yay! I earned \(badgeDetails.gold) gold, \(badgeDetails.silver) silver, and \(badgeDetails.bronze) bronze badges on the iHero app"
        let textToShare = [sharingText]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view
        activityViewController.excludedActivityTypes = [.airDrop]
        present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func allStatusButtonAction(_ sender: UIButton) {
        self.openRewardStatusView()
    }
    
    func openRewardStatusView(showAll: Bool = true, categoryId: Int = 0) {
        guard let rewardStatusViewController = UIStoryboard.main?.instantiateViewController(withClass: RewardStatusViewController.self) else {
            return
        }
        rewardStatusViewController.showAll = showAll
        rewardStatusViewController.categoryId = categoryId
        rewardStatusViewController.categoryReasonDetails.categoryReasons = categoryReasonDetails.categoryReasons
        self.navigationController?.pushViewController(rewardStatusViewController, animated: true)
    }
    
}
