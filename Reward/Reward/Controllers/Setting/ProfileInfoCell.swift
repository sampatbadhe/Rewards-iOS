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
        configureWithModel()
    }
    
    func configureWithModel() {
        guard let user = GIDSignIn.sharedInstance()?.currentUser else {
            return
        }
        userNameLabel.text = user.profile.givenName + " " + user.profile.familyName
        emailLabel.text = user.profile.email
    }

}
