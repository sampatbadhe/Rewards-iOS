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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.cornerRadius = 10
        statusLabel.borderWidth = 1
        statusLabel.textColor = UIColor.white
        reasonTitleLabel.text = "Reason:"
        reasonTitleLabel.font = UIFont().preferredFont(for: .callout, weight: .semibold)
    }
    
    func configureWithModel(rewardDetail: RewardModel, categoryReasonDetails: CategoryReasonListModel) {
        guard let categoryDetail = categoryReasonDetails.categoryReasons.filter({ (object) -> Bool in
            return object.id == rewardDetail.categoryReasonId
        }).first else {
            return
        }
        medalImageView.image = categoryDetail.badge?.image
        typeLabel.text = rewardDetail.categoryId.title
        statusLabel.text = rewardDetail.status?.capitalized
        statusLabel.backgroundColor = Common.getStatusColor(status: rewardDetail.status)
        statusLabel.borderColor = Common.getStatusColor(status: rewardDetail.status)
        reasonLabel.text = categoryDetail.reason
        dateLabel.text = rewardDetail.activityDate?.dateString()
        guard let comments = rewardDetail.comments else {
            return
        }
        commentLabel.text = comments.isEmpty ? String() : comments
        commentLabelTopConstraint.constant = comments.isEmpty ? 0 : 15
    }

}
