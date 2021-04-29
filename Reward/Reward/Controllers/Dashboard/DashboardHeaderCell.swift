//
//  DashboardHeaderCell.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit

class DashboardHeaderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont().preferredFont(for: .title2, weight: .bold)
    }
    
    func configureDetails(_ title: String) {
        titleLabel.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners([.topLeft, .topRight], radius: 10)
    }

}
