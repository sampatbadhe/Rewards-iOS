//
//  TeamHeaderCell.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit

class TeamHeaderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = Constants.Title.teamBreakdown
        titleLabel.font = titleLabel.font.bold
    }

}
