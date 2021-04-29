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
    
    let apiManager = APIManager()
    var categoryBadgeDetails = List<CategoryBadgesModel>()
    var badgeTallyDetails = BadgesTallyModel()
    var categoryReasonDetails = CategoryReasonListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.myView
        apiManager.delegate = self
        setNavigationBarButton()
        setTableView()
        callMyViewAPI()
        callCategoryReasonsAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
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
        let sharingText = "Yay! I earned \(badgeTallyDetails.gold) gold, \(badgeTallyDetails.silver) silver, and \(badgeTallyDetails.bronze) bronze badges on the iHero app"
        let textToShare = [sharingText]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view
        activityViewController.excludedActivityTypes = [.airDrop]
        present(activityViewController, animated: true, completion: nil)
    }
    
    func openRewardStatusView(showAll: Bool = true, categoryId: Int = 0) {
        guard let rewardStatusViewController = UIStoryboard.main?.instantiateViewController(withClass: RewardStatusViewController.self) else {
            return
        }
        rewardStatusViewController.showAll = showAll
        rewardStatusViewController.categoryId = categoryId
        self.navigationController?.pushViewController(rewardStatusViewController, animated: true)
    }
    
}
