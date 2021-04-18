//
//  SettingViewController.swift
//  Reward
//
//  Created by Darshan on 18/04/21.
//

import UIKit
import SwifterSwift

class SettingViewController: UIViewController {

    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var profileBorderView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting"
        setUI()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUI()
    }
    
    func setUI() {
        gradientView.addShadow(ofColor: R.color.shadow() ?? .clear, radius: 5, offset: .zero, opacity: 1)
        profileBorderView.addShadow(ofColor: R.color.shadow() ?? .clear, radius: 5, offset: .zero, opacity: 1)
    }
    
}
