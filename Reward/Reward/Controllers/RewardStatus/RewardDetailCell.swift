//
//  RewardDetailCell.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit

class RewardDetailCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var medalImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    
    var categoryReasonDetails = CategoryReasonListModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.cornerRadius = 10
        getCategoryReasonDetails()
    }
    
    private func getCategoryReasonDetails() {
        categoryReasonDetails.categoryReasonList = RealmManager.shared.getFirstResult(type: CategoryReasonListModel.self).categoryReasonList
    }
    
    func configureWithModel(rewardDetail: RewardModel) {
        medalImageView.image = #imageLiteral(resourceName: "goldMedal")
        typeLabel.text = rewardDetail.categoryId.title
        statusLabel.text = rewardDetail.status
        let categoryReason = categoryReasonDetails.categoryReasonList.filter{ (object) -> Bool in
            return object.id == rewardDetail.categoryReasonId
        }
        reasonLabel.text = categoryReason.first?.reason
    }

}
