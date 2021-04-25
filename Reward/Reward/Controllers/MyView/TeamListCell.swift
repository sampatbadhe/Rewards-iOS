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
        totalMedalCountLabel.font = totalMedalCountLabel.font.bold
    }
    
    func configureWithModel(index: Int) {
        teamTitleLabel.text = "Team \(index)"
        totalMedalCountLabel.text = "\(index + 10)"
    }

}
