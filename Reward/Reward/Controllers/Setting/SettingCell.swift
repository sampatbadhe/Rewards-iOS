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
    
    func configureWithModel(settingInfo :SettingInfo, index: Int) {
        settingImageView.image = settingInfo.image?.withRenderingMode(.alwaysTemplate)
        settingTitleLabel.text = settingInfo.title
        settingSwitch.isHidden = !settingInfo.switchVisibility
    }

}
