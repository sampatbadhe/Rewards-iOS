//
//  ProfileInfoCell.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit
import SwifterSwift
import SDWebImage

class ProfileInfoCell: UITableViewCell {

    @IBOutlet weak var profileBorderView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureWithModel()
        setUI()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUI()
    }
    
    private func setUI() {
        profileBorderView.addShadow(ofColor: R.color.cardShadow() ?? .clear, radius: 5, offset: .zero, opacity: 1)
        profileBorderView.borderColor = R.color.border()
    }
    
    func configureWithModel() {
        let userDetail = RealmManager.shared.getFirstResult(type: UserProfileModel.self)
        userNameLabel.text = userDetail.fullName()
        emailLabel.text = userDetail.email
        profileImageView.sd_setImage(with: URL(string: userDetail.profilePicUrl), placeholderImage: R.image.userPlaceholder())
    }

}
