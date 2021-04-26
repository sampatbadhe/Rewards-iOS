//
//  MyViewViewController.swift
//  Reward
//
//  Created by Darshan on 25/04/21.
//

import UIKit

class MyViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    
    let apiManager = APIManager()
    var teamList = [TeamListInfo]()
    var teamCategoryDetails = TeamCategoryModel()
    var medalCategoryDetails = MedalCategoryModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NavigationTitle.myView
        apiManager.delegate = self
        setNavigationBarButton()
        setTableView()
        callMyViewAPI()
    }
    
    func setNavigationBarButton() {
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareAction(_:)))
        navigationItem.rightBarButtonItem = shareButton
    }
    
    func setTableView() {
        tableView.isHidden = true
        tableView.refreshControlAction = { sender in
            self.callMyViewAPI()
        }
    }
    
    func getTeamListDetails() {
        teamList.removeAll()
        let ceo = TeamListInfo(type: .coe, medalCount: teamCategoryDetails.coe)
        let hiring = TeamListInfo(type: .hiring, medalCount: teamCategoryDetails.hiring)
        let kfc = TeamListInfo(type: .kfc, medalCount: teamCategoryDetails.kfc)
        let others = TeamListInfo(type: .others, medalCount: teamCategoryDetails.others)
        let referral = TeamListInfo(type: .referral, medalCount: teamCategoryDetails.referral)
        teamList.append(contentsOf: [ceo, hiring, kfc, others, referral])
    }
    
    func callMyViewAPI() {
        Loader.shared.show()
        apiManager.callAPI(request: myViewAPIRequest())
    }
    
    func myViewAPIRequest() -> APIRequest {
        return APIRequest(url: APIUrlStruct(apiPath: .v1, apiUrl: .myView))
    }
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        
    }
    
}
