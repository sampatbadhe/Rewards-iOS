//
//  TopContributorsCell.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit
import SwifterSwift
import SDWebImage

class TopContributorsCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var goldCountLabel: UILabel!
    @IBOutlet weak var silverCountLabel: UILabel!
    @IBOutlet weak var bronzeCountLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont().preferredFont(for: .headline, weight: .bold)
    }
    
    func configureWithModel(_ contributor: ContributorModel) {
        titleLabel.text = contributor.name()
        goldCountLabel.text = String(contributor.badges?.gold ?? Int())
        silverCountLabel.text = String(contributor.badges?.silver ?? Int())
        bronzeCountLabel.text = String(contributor.badges?.bronze ?? Int())
        rankLabel.text = contributor.rank.ordinal
        profileImageView.sd_setImage(with: URL(string: contributor.photoUrl), placeholderImage: R.image.userPlaceholder())
    }

}
