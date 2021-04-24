//
//  SettingCell.swift
//  Reward
//
//  Created by Darshan on 24/04/21.
//

import UIKit
import SwifterSwift

class SettingCell: UITableViewCell {

    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingTitleLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUI()
    }
    
    private func setUI() {
        settingImageView.tintColor = R.color.shadow()
    }
    
    func configureWithModel(index: Int, settingInfo :SettingInfo) {
        settingImageView.image = settingInfo.image?.withRenderingMode(.alwaysTemplate)
        settingTitleLabel.text = settingInfo.title
        settingSwitch.isHidden = index != 1
        setUI()
    }

}