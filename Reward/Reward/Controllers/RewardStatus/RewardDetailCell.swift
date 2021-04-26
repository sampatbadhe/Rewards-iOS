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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.cornerRadius = 10
    }
    
    func configureWithModel(rewardDetail: RewardModel) {
        medalImageView.image = #imageLiteral(resourceName: "goldMedal")
        typeLabel.text = rewardDetail.categoryId.title
        statusLabel.text = rewardDetail.status
    }

}
