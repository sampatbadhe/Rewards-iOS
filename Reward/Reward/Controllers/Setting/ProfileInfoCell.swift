//
//  ProfileInfoCell.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit
import SwifterSwift
import GoogleSignIn

class ProfileInfoCell: UITableViewCell {

    @IBOutlet weak var profileBorderView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        configureWithModel()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUI()
    }
    
    private func setUI() {
        profileBorderView.cornerRadius = profileBorderView.height / 2
        profileImageView.cornerRadius = profileImageView.height / 2
        profileBorderView.addShadow(ofColor: R.color.shadow() ?? .clear, radius: 5, offset: .zero, opacity: 1)
    }
    
    func configureWithModel() {
        guard let user = GIDSignIn.sharedInstance()?.currentUser else {
            return
        }
        userNameLabel.text = user.profile.givenName + " " + user.profile.familyName
        emailLabel.text = user.profile.email
    }

}