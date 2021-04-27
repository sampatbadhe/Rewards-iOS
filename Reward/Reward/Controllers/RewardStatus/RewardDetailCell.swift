//
//  RewardDetailCell.swift
//  Reward
//
//  Created by Darshan on 27/04/21.
//

import UIKit
import SwifterSwift

class RewardDetailCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var medalImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var statusLabel: PaddingLabel!
    @IBOutlet weak var reasonTitleLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateLabel: UILabel!
    
    var categoryReasonDetails = CategoryReasonListModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.cornerRadius = 10
        statusLabel.borderWidth = 1
        statusLabel.textColor = UIColor.white
        reasonTitleLabel.text = "Reason:"
        reasonTitleLabel.font = UIFont().preferredFont(for: .callout, weight: .semibold)
        getCategoryReasonDetails()
    }
    
    private func getCategoryReasonDetails() {
        categoryReasonDetails.categoryReasonList = RealmManager.shared.getFirstResult(type: CategoryReasonListModel.self).categoryReasonList
    }
    
    func configureWithModel(rewardDetail: RewardModel) {
        let categoryDetail = categoryReasonDetails.categoryReasonList.filter{ (object) -> Bool in
            return object.id == rewardDetail.categoryReasonId
        }
        medalImageView.image = Common.getMedalType(type: categoryDetail.first?.badge)
        typeLabel.text = rewardDetail.categoryId.title
        statusLabel.text = rewardDetail.status?.capitalized
        statusLabel.backgroundColor = Common.getStatusColor(status: rewardDetail.status)
        statusLabel.borderColor = Common.getStatusColor(status: rewardDetail.status)
        reasonLabel.text = categoryDetail.first?.reason
        dateLabel.text = rewardDetail.activityDate?.dateString()
        guard let comments = rewardDetail.comments else {
            return
        }
        commentLabel.text = comments.isEmpty ? String() : comments
        commentLabelTopConstraint.constant = comments.isEmpty ? 0 : 15
    }

}
