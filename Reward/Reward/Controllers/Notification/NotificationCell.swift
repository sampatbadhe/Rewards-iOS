//
//  NotificationCell.swift
//  Reward
//
//  Created by Darshan on 29/04/21.
//

import UIKit
import SwifterSwift

class NotificationCell: UITableViewCell {

    @IBOutlet weak var notificationDetailLabel: UILabel!
    @IBOutlet weak var notificationDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureWithModel() {
        notificationDetailLabel.text = String()
        notificationDateLabel.text = Date().getElapsedInterval()
    }

}
