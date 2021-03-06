//
//  TeamListCell.swift
//  Reward
//
//  Created by Darshan on 25/04/21.
//

import UIKit

class TeamListCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var teamTitleLabel: UILabel!
    @IBOutlet weak var totalMedalCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.cornerRadius = 10
        teamTitleLabel.font = teamTitleLabel.font.bold
        totalMedalCountLabel.font = totalMedalCountLabel.font.bold
    }
    
    func configureWithModel(teamDetails: CategoryBadgesModel) {
        teamTitleLabel.text = teamDetails.categoryName
        totalMedalCountLabel.text = teamDetails.totalBadgeCount.toString
    }

}
